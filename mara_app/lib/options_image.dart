import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'model/method_repository.dart';
import 'providers/provider_liked_methods.dart';

class OptionsImage extends StatelessWidget {
  // works with an aspect ratio of 16/10
  final double containerWidth, containerHeight;
  final int? methodIndex;
  final Function updateIndex;
  OptionsImage(this.containerWidth, this.containerHeight, this.methodIndex, this.updateIndex, {super.key});
  final methods = MethodRepository.loadMethods();

  @override
  Widget build(BuildContext context) {
    var likes = context.watch<Likes>();
    Set<String> likedMethods = likes.likedMethods;
    List<Widget> result = [];
    result.add(
      methodIndex == 0 ? Positioned(
        top: 0.05 * containerHeight,
        left: 0.3 * containerWidth,
        child: Image.asset('assets/iud_picture_of_woman.png', height: 0.7 * containerHeight)
      ) :
      Positioned(
        top: 0.1 * containerHeight,
        left: -0.1 * containerWidth,
        child: Image.asset('assets/woman.png', height: 0.7 * containerHeight),
      ),
    );
    for (var methodId in methods.keys) {
      var curMethod = methods[methodId];
      result.add(
        Positioned(
          top: containerHeight * curMethod!.arrowTop,
          left: containerWidth * curMethod.arrowLeft,
          child: Visibility(
            visible: methodIndex == methodId,
            child: SvgPicture.asset(curMethod.arrowName, height: containerHeight * curMethod.arrowSize),
          ),
        ),
      );
    }
    // adds icons on top of arrows so they don't interfere with clicking
    for (var methodId in methods.keys) {
      var curMethod = methods[methodId];
      result.add(
        Positioned(
          top: containerHeight * curMethod!.top,
          left: containerWidth * curMethod.left,
          child: _buildIconButton(context, likedMethods, curMethod.icon, methodId, containerWidth * curMethod.size),
        ),
      );
      // result.add(
      //   Positioned(
      //     top: containerHeight * curMethod!.top + containerWidth * curMethod.size * 1.1,
      //     left: containerWidth * curMethod.left + containerWidth * 0.1,
      //     child: Text('text'),
      //   ),
      // );
    }

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: containerWidth,
        height: containerHeight,
        child: Stack(
          children: result,
        ),
      ),
    );
  }

  Widget _buildIconButton(BuildContext context, Set<String> likedMethods, IconData iconData, int index, double size) {
    var likes = context.read<Likes>();
    bool isSelected = index == methodIndex;

    return Center(
      child: Column(
        children: <Widget>[
              IconButton(
                icon: Icon(
                  iconData,
                  color: (isSelected || methodIndex == null) ? Colors.black : Colors.grey,
                ),
                // TODO - update so that state is managed from options_page instead
                onPressed: () {
                  updateIndex(index);
                },
                color: isSelected ? Colors.black : Colors.transparent,
                iconSize: size,
                padding: EdgeInsets.all(10),
                splashRadius: 40,
                splashColor: Colors.grey.withOpacity(0.5),
                highlightColor: Colors.transparent,
              ),
          Row(
            children: <Widget>[
            // IconButton(
            //       icon: likes.likedMethods.contains(methods[index]!.jsonRef) ?
            //         Icon(Icons.thumb_up) : Icon(Icons.thumb_up_off_alt),
            //         onPressed: () {
            //           likes.toggleLikedMethod(methods[index]!.jsonRef);
            //         }
            // ),
            Text(
              methods[index]!.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                // color: Colors.black,
                color: (isSelected || methodIndex == null) ? Colors.black : Colors.grey,
              ),
            ),
          ],
        ),
        Row( //Thumbs up button below the method name
          children: <Widget>[
            ElevatedButton.icon(
                  // icon: likes.likedMethods.contains(methods[index]!.jsonRef) ? Icon(Icons.thumb_up) : Icon(Icons.thumb_up_off_alt),               
                  icon: Icon(
                    likedMethods.contains(methods[index]!.jsonRef) ? Icons.thumb_up : Icons.thumb_up_off_alt,
                    color: likedMethods.contains(methods[index]!.jsonRef) ? Colors.brown[900] : Colors.black,
                  ),
                  label: Text("I like this!"), // The label (text)
                  style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.deepPurple[100], // Button background color
                     foregroundColor: Colors.black 
                  ),
                  // style: ButtonStyle(
                  //   backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  //     (Set<MaterialState> states) {
                  //       if (states.contains(MaterialState.pressed))
                  //         return Color.fromARGB(255, 36, 128, 248);
                  //       return Color.fromRGBO(209, 196, 233, 1);
                  //     },
                  //   ),
                  //   foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                  // ),
                  onPressed: () {
                      likes.toggleLikedMethod(methods[index]!.jsonRef);

                  }
            ),
          ],
        ),
        ],
      ),
    );
  }

}
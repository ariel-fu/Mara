import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'model/method_repository.dart';
import 'providers/provider_liked_methods.dart';
import 'package:mara_app/design/colors.dart';
import 'package:mara_app/icons/image_asset_strings.dart';
import 'session_manager.dart';import 'package:shared_preferences/shared_preferences.dart';

class OptionsImage extends StatefulWidget {
  // works with an aspect ratio of 16/10
  final double containerWidth, containerHeight;
  final int? methodIndex;
  final Function updateIndex;
  OptionsImage(this.containerWidth, this.containerHeight, this.methodIndex,
      this.updateIndex,
      {Key? key})
      : super(key: key);

  @override
  _OptionsImageState createState() => _OptionsImageState();
}

class _OptionsImageState extends State<OptionsImage> {
    final methods = MethodRepository.loadMethods();
  // int count = 0;
    String _currentLanguage = "English";
  int languageIndex = 2;
  final languages = ["Kiswahili", "Dholuo", "English"];

  final Map<String, String> _translations = {
    'English': "Favorite it!",
    'Dholuo': "Kete obed mihero!",
    'Kiswahili': "Ipende!",
  };

  Future<void> _loadCurrentLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentLanguage = prefs.getString('selectedLanguage') ?? 'English';
    });
    if (_currentLanguage.contains('English')) {
      languageIndex = 2;
    } else if (_currentLanguage.contains('Dholuo')) {
      languageIndex = 1;
    } else {
      languageIndex = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
     _loadCurrentLanguage();
    _currentLanguage = languages[languageIndex];
    var likes = context.watch<Likes>();
    Set<String> likedMethods = likes.likedMethods;
    List<Widget> result = [];
    result.add(
      widget.methodIndex == 0
          ? Positioned(
              top: 0.1 * widget.containerHeight,
              left: 0.35 * widget.containerWidth,
              child: Image.asset(ImagePaths.iudWoman,
                  height: 0.7 * widget.containerHeight))
          : Positioned(
              top: 0.1 * widget.containerHeight,
              left: 0.35 * widget.containerWidth,
              child: Image.asset(ImagePaths.woman,
                  height: 0.9 * widget.containerHeight),
            ),
    );
    for (var methodId in methods.keys) {
      var curMethod = methods[methodId];
      result.add(
        Positioned(
          top: widget.containerHeight * curMethod!.arrowTop,
          left: widget.containerWidth * curMethod.arrowLeft,
          child: Visibility(
            visible: widget.methodIndex == methodId,
            child: SvgPicture.asset(curMethod.arrowName,
                height: widget.containerHeight * curMethod.arrowSize),
          ),
        ),
      );
    }
    // adds icons on top of arrows so they don't interfere with clicking
    for (var methodId in methods.keys) {
      var curMethod = methods[methodId];
      result.add(
        Positioned(
          top: widget.containerHeight * curMethod!.top,
          left: widget.containerWidth * curMethod.left,
          child: _buildIconButton(context, likedMethods, curMethod.icon,
              methodId, widget.containerWidth * curMethod.size),
        ),
      );
    }

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        // color: Colors.lightBlue[50],
        width: widget.containerWidth,
        height: widget.containerHeight,
        child: Stack(
          children: result,
        ),
      ),
    );
  }

  Widget _buildIconButton(BuildContext context, Set<String> likedMethods,
      IconData iconData, int index, double size) {
    var likes = context.read<Likes>();
    bool isSelected = index == widget.methodIndex;

    return Center(
      child: Column(
        children: <Widget>[
          IconButton(
            icon: Icon(
              iconData,
              color: (isSelected || widget.methodIndex == null)
                  ? MaraColors.magentaPurple
                  : MaraColors.lightPurple,
            ),
                
                // TODO - update so that state is managed from options_page instead
                onPressed: () {
                  widget.updateIndex(index);
                  
                  SessionManager.logEvent("OptionsPage-Method$index", methods[index]!.name);
                  print("OptionsPage-Method$index ${methods[index]!.name}");
                },
                color: isSelected ? Colors.black : Colors.transparent,
                iconSize: size,
                padding: EdgeInsets.all(10),
                splashRadius: 20,
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
                color: (isSelected || widget.methodIndex == null)
                      ? Colors.black
                      : Colors.grey,              ),
            ),
          ],
        ),
        Row(
            //Thumbs up button below the method name
            children: <Widget>[
              ElevatedButton.icon(
                  icon: Icon(
                    likedMethods.contains(methods[index]!.jsonRef)
                        ? Icons.thumb_up
                        : Icons.thumb_up_off_alt,
                    color: likedMethods.contains(methods[index]!.jsonRef)
                        ? Colors.brown[900]
                        : Colors.black,
                  ),
                  label: Text(_translations[_currentLanguage]!),
                  // The label (text)
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple[100],
                      // Button background color
                      foregroundColor: Colors.black),

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

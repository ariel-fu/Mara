import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'model/method_repository.dart';

class OptionsImage extends StatelessWidget {
  // works with an aspect ratio of 16/10
  final double containerWidth, containerHeight;
  final int? methodIndex;
  final Function updateIndex;
  OptionsImage(this.containerWidth, this.containerHeight, this.methodIndex, this.updateIndex, {super.key});

  @override
  Widget build(BuildContext context) {
    final methods = MethodRepository.loadMethods();
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
          child: _buildIconButton(curMethod.icon, methodId, containerWidth * curMethod.size),
        ),
      );
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

  Widget _buildIconButton(IconData iconData, int index, double size) {
    bool isSelected = index == methodIndex;

    return Center(
      child: IconButton(
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
    );
  }
}
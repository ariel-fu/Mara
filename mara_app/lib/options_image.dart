import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'icons/mara_icons_icons.dart' show MaraIcons;

class OptionsImage extends StatelessWidget {
  // works with an aspect ratio of 16/10
  final double containerWidth, containerHeight;
  final int? methodIndex;
  Function updateIndex;
  OptionsImage(this.containerWidth, this.containerHeight, this.methodIndex, this.updateIndex);

  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: containerWidth,
        height: containerHeight,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0.1 * containerHeight,
              left: -0.1 * containerWidth,
              child: Image.asset('assets/woman.png', height: 0.7 * containerHeight),
            ),
            Positioned(
              top: containerHeight * 0.05,
              left: containerWidth * 0.52,
              child: Visibility(
                visible: methodIndex == 1,
                child: SvgPicture.asset('assets/options-icons/arrow_birth_control_pills.svg', height: containerHeight * 0.15)
              ),
            ),
            Positioned(
              top: containerHeight * 0.42,
              left: containerWidth * 0.55,
              child: Visibility(
                visible: methodIndex == 5,
                child: SvgPicture.asset('assets/options-icons/arrow_female_condom.svg', height: containerHeight * 0.44),
              ),
            ),
            // Icons on top of the background image
            Positioned(
              top: containerHeight * 0.05, // 5% from the top
              left: containerWidth * 0.7, // 5% from the left
              child: _buildIconButton(MaraIcons.birth_control_pills, 1, containerWidth * 0.16),
            ),
            Positioned(
              top: containerHeight * 0.05,
              left: containerWidth * 0.1,
              child: Visibility(
                visible: methodIndex == 3,
                child: SvgPicture.asset('assets/options-icons/arrow_contraceptive_implant.svg', height: containerHeight * 0.2),
              ),
            ),
            Positioned(
              top: containerHeight * 0.05,
              left: containerWidth * 0.1,
              child: _buildIconButton(MaraIcons.contraceptive_implant, 3, containerWidth * 0.2),
            ),
            Positioned(
              top: containerHeight * 0.2,
              left: containerWidth * 0.52,
              child: Visibility(
                visible: methodIndex == 6,
                child: SvgPicture.asset('assets/options-icons/arrow_double_pills.svg', height: containerHeight * 0.2)
              ),
            ),
            Positioned(
              top: containerHeight * 0.28,
              left: containerWidth * 0.75,
              child: _buildIconButton(MaraIcons.double_pills, 6, containerWidth * 0.12),
            ),
            Positioned(
              top: containerHeight * 0.5,
              left: containerWidth * 0.68,
              child: Visibility(
                visible: methodIndex == 2,
                child: SvgPicture.asset('assets/options-icons/arrow_condom.svg', height: containerHeight * 0.15),
              ),
            ),
            Positioned(
              top: containerHeight * 0.51,
              left: containerWidth * 0.7,
              child: _buildIconButton(MaraIcons.condom, 2, containerWidth * 0.18),
            ),
            Positioned(
              top: containerHeight * 0.7,
              left: containerWidth * 0.65,
              child: _buildIconButton(MaraIcons.female_condom, 5, containerWidth * 0.25),
            ),
            Positioned(
              top: containerHeight * 0.28,
              left: containerWidth * 0.04,
              child: Visibility(
                visible: methodIndex == 4,
                child: SvgPicture.asset('assets/options-icons/arrow_syringe.svg', height: containerHeight * 0.16),
              ),
            ),
            Positioned(
              top: containerHeight * 0.3,
              left: containerWidth * 0.05,
              child: _buildIconButton(MaraIcons.syringe, 4, containerWidth * 0.18),
            ),
            Positioned(
              top: containerHeight * 0.4,
              left: containerWidth * 0.02,
              child: Visibility(
                visible: methodIndex == 0,
                child: SvgPicture.asset('assets/options-icons/arrow_iud.svg', height: containerHeight * 0.35),
              ),
            ),
            Positioned(
              top: containerHeight * 0.61,
              left: containerWidth * 0.03,
              child: _buildIconButton(MaraIcons.iud, 0, containerWidth * 0.2),
            ),
          ],
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
import 'package:flutter/material.dart';
import 'option_pages/pills.dart';
import 'options_button.dart';

import 'icons/mara_icons_icons.dart' show MaraIcons;

class OptionsPage extends StatefulWidget {
  const OptionsPage({Key? key}) : super(key: key);

  @override
  State<OptionsPage> createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
  bool overrideIndex = false;
  int selectedButtonIndex = 0; // Default value

  List<List<String>> languages = List.generate(3, (_) => <String>[]);
  // Change value to set aspect ratio
  final double _aspectRatio = 16 / 10;

  @override
  Widget build(BuildContext context) {
    // Receive selectedButtonIndex as a route argument if available
    final int? routeArgumentIndex =
        ModalRoute.of(context)?.settings.arguments as int?;

    // Update selectedButtonIndex if a valid value is provided from the route
    if (routeArgumentIndex != null &&
        routeArgumentIndex >= 0 &&
        routeArgumentIndex < languages.length &&
        !overrideIndex) {
      selectedButtonIndex = routeArgumentIndex;
    }

    double containerWidth = MediaQuery.of(context).size.width;
    double containerHeight = MediaQuery.of(context).size.height;
    if (containerHeight / containerWidth > _aspectRatio) {
      containerHeight = containerWidth * _aspectRatio;
    } else {
      containerWidth = containerHeight / _aspectRatio;
    }
    // var selectedButtonIndex = input == null ? input : 0;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/home', arguments: selectedButtonIndex);
          },
        ),
        title: const Text('Options'),
        actions: [
          // Buttons with translations on the top right
          ElevatedButton(
            onPressed: () {
              setState(() {
                overrideIndex = true;
                selectedButtonIndex = 0;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: selectedButtonIndex == 0 ? Colors.grey : null,
            ),
            child: Text(
              languages.isNotEmpty && languages[0].isNotEmpty ? languages[0][0] : '',
            ),
          ),
          const SizedBox(width: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                overrideIndex = true;
                selectedButtonIndex = 1;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: selectedButtonIndex == 1 ? Colors.grey : null,
            ),
            child: Text(
              languages.isNotEmpty && languages[1].isNotEmpty ? languages[1][0] : '',
            ),
          ),
          const SizedBox(width: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                overrideIndex = true;
                selectedButtonIndex = 2;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: selectedButtonIndex == 2 ? Colors.grey : null,
            ),
            child: Text(
              languages.isNotEmpty && languages[2].isNotEmpty ? languages[2][0] : '',
            ),
          ),
        ],
      ),
      // body
      body: Container(
        width: containerWidth,
        height: containerHeight,
        // color: Colors.blue, // Set background color or use an image
        child: Stack(
          // alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0.1 * containerHeight,
              left: -0.1 * containerWidth,
              child: Image.asset('assets/woman.png', height: 0.7 * containerHeight),
                // icon: SvgPicture.asset('assets/options-icons/noun-contraceptive-implant-2860656.svg', height: 50),  // replace with image
              ),
            // Icons on top of the background image
            Positioned(
              top: containerHeight * 0.05, // 5% from the top
              left: containerWidth * 0.7, // 5% from the left
              child: OptionsIconButton(
                icon: MaraIcons.birth_control_pills, size: containerWidth * 0.2,
                methodTitle: 'Pills', description: 'Pills description'),
            ),
            Positioned(
              top: containerHeight * 0.05,
              left: containerWidth * 0.1,
              child: OptionsIconButton(
                icon: MaraIcons.contraceptive_implant, size: containerWidth * 0.2,
                methodTitle: 'Implant', description: 'Implant description',
              ),
            ),
            Positioned(
              top: containerHeight * 0.28,
              left: containerWidth * 0.75,
              child: OptionsIconButton(
                icon: MaraIcons.double_pills, size: containerWidth * 0.15,
                methodTitle: 'Pills 2', description: 'Pills 2 description',
              ),
            ),
            Positioned(
              top: containerHeight * 0.5,
              left: containerWidth * 0.7,
              child: OptionsIconButton(
                icon: MaraIcons.condom, size: containerWidth * 0.2,
                methodTitle: 'Condom', description: 'Condom description',
              ),
            ),
            Positioned(
              top: containerHeight * 0.7,
              left: containerWidth * 0.65,
              child: OptionsIconButton(
                icon: MaraIcons.female_condom, size: containerWidth * 0.25,
                methodTitle: 'Female Condom', description: 'Female condom description',
              ),
            ),
            Positioned(
              top: containerHeight * 0.3,
              left: containerWidth * 0.05,
              child: OptionsIconButton(
                icon: MaraIcons.syringe, size: containerWidth * 0.2,
                methodTitle: 'Injection', description: 'Injection description',
              ),
            ),
            Positioned(
              top: containerHeight * 0.6,
              left: containerWidth * 0.02,
              child: OptionsIconButton(
                icon: MaraIcons.iud, size: containerWidth * 0.25,
                methodTitle: 'IUD', description: 'IUD description',
              ),
            ),
          ],
        ),
      ),
    );
  }
}


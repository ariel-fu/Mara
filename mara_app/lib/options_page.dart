import 'package:flutter/material.dart';
import 'option_pages/pills.dart';
import 'options_button.dart';
import 'model/method_repository.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'icons/mara_icons_icons.dart' show MaraIcons;

class OptionsPage extends StatefulWidget {
  const OptionsPage({Key? key}) : super(key: key);

  @override
  State<OptionsPage> createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
  // String? _selectedMethod;
  int? methodIndex;
  bool overrideIndex = false;
  int _languageIndex = 0; // Default value
  final languages = ["Kiswahili", "Dholuo", "English"];
  final methods = MethodRepository.loadMethods();
  final content = [
    'IUD',
    'Pills',
    'Condom',
    'Implant',
    'Depo Injection',
    'Female Condom',
    '2-Pill',];

  // List<List<String>> languages = List.generate(3, (_) => <String>[]);
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
      _languageIndex = routeArgumentIndex;
    }

    double containerWidth = MediaQuery.of(context).size.width * 0.8;
    double containerHeight = MediaQuery.of(context).size.height * 0.8;
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
            Navigator.of(context).pushReplacementNamed('/home', arguments: _languageIndex);
          },
        ),
        title: const Text('Options'),
        actions: [
          // Buttons with translations on the top right
          ElevatedButton(
            onPressed: () {
              setState(() {
                overrideIndex = true;
                _languageIndex = 0;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: _languageIndex == 0 ? Colors.grey : null,
            ),
            child: Text(
              languages.isNotEmpty && languages[0].isNotEmpty ? languages[0] : '',
            ),
          ),
          const SizedBox(width: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                overrideIndex = true;
                _languageIndex = 1;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: _languageIndex == 1 ? Colors.grey : null,
            ),
            child: Text(
              languages.isNotEmpty && languages[1].isNotEmpty ? languages[1] : '',
            ),
          ),
          const SizedBox(width: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                overrideIndex = true;
                _languageIndex = 2;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: _languageIndex == 2 ? Colors.grey : null,
            ),
            child: Text(
              languages.isNotEmpty && languages[2].isNotEmpty ? languages[2] : '',
            ),
          ),
        ],
      ),
      // body
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
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
                // child: OptionsIconButton(
                //   icon: MaraIcons.birth_control_pills, size: containerWidth * 0.18,
                //   methodTitle: 'Pills', description: 'Pills description'),
                child: buildIconButton(MaraIcons.birth_control_pills, 1, containerWidth * 0.16),
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
                // child: OptionsIconButton(
                //   icon: MaraIcons.contraceptive_implant, size: containerWidth * 0.2,
                //   methodTitle: 'Implant', description: 'Implant description',
                // ),
                child: buildIconButton(MaraIcons.contraceptive_implant, 3, containerWidth * 0.2),
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
                // child: OptionsIconButton(
                //   icon: MaraIcons.double_pills, size: containerWidth * 0.12,
                //   methodTitle: 'Pills 2', description: 'Pills 2 description',
                // ),
                child: buildIconButton(MaraIcons.double_pills, 6, containerWidth * 0.12),
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
                // child: OptionsIconButton(
                //   icon: MaraIcons.condom, size: containerWidth * 0.18,
                //   methodTitle: 'Condom', description: 'Condom description',
                // ),
                child: buildIconButton(MaraIcons.condom, 2, containerWidth * 0.18),
              ),
              Positioned(
                top: containerHeight * 0.7,
                left: containerWidth * 0.65,
                // child: OptionsIconButton(
                //   icon: MaraIcons.female_condom, size: containerWidth * 0.25,
                //   methodTitle: 'Female Condom', description: 'Female condom description',
                // ),
                child: buildIconButton(MaraIcons.female_condom, 5, containerWidth * 0.25),
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
                // child: OptionsIconButton(
                //   icon: MaraIcons.syringe, size: containerWidth * 0.18,
                //   methodTitle: 'Injection', description: 'Injection description',
                // ),
                child: buildIconButton(MaraIcons.syringe, 4, containerWidth * 0.18),
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
                // child: OptionsIconButton(
                //   icon: MaraIcons.iud, size: containerWidth * 0.2,
                //   methodTitle: 'IUD', description: 'IUD description',
                // ),
                child: buildIconButton(MaraIcons.iud, 0, containerWidth * 0.2),
              ),
              // Align(
              //   alignment: Alignment.bottomCenter,
              //   child: Container(
              //       width: 300,
              //       height: 200,
              //       // alignment: Alignment.bottomCenter,
              //       decoration: BoxDecoration(
              //         border: Border.all(width: 5, color: Colors.green),
              //         color: Colors.white,
              //       ),
              //       // color: Colors.lime,
              //       child: Center(
              //         child: methodIndex == null ? Text("Please select a method to learn more") : Text(content[methodIndex!]),
              //       ),
              //     ),
              // ),
              // Positioned(  // close / deselect all
              //   top: containerHeight * 0.7,
              //   left: containerWidth * 0.2,
              //   child: IconButton(icon: Icon(Icons.close),
              //   onPressed: () => {
              //     setState(() {
              //       methodIndex = null;
              //     })
              //   }),
              // ),
              // Positioned(  // close / deselect all
              //   // top: containerHeight * 0.82,
              //   // left: containerWidth * 0.8,
              //   top: containerHeight * 0.86,
              //   left: containerWidth * 0.5,
              //   child: ElevatedButton(
              //     child: Text('Learn more'),
              //     style: ElevatedButton.styleFrom(
              //       foregroundColor: Colors.black,
              //       // backgroundColor: Colors.lime,
              //       backgroundColor: Colors.green,
              //       // side: BorderSide(color: Colors.black),
              //     ),
              //     onPressed: methodIndex == null ? null : () => {
              //       methodIndex = null,
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(builder: (context) => PillInfo()),
              //       )
              //     },
              //     // () => {
              //     //   setState(() {
              //     //     methodIndex = null;
              //     //   })
              //     // }
              //   ),
              // ),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            methodIndex == null ? SizedBox(height: 20.0) :
                Text(content[methodIndex!],
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            methodIndex == null ? Text("Please select a method to learn more") : Text("description"),
            SizedBox(height: 70.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(icon: Icon(Icons.volume_up), onPressed: () => {}),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => {
                    setState(() {
                      methodIndex = null;
                    })
                  },
                  // style: ElevatedButton.styleFrom(
                  //   side: BorderSide(color: Colors.black),
                  //   backgroundColor: Colors.lime,
                  // ),
                  child: Text('Clear'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: methodIndex == null ? null : () => {
                    methodIndex = null,
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PillInfo()),
                    )
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.green,
                  ),
                  child: Text('Learn more'),
                ),
              ],
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
      // Text("hello"),
    );
  }

  Widget buildIconButton(IconData iconData, int index, double size) {
    bool isSelected = index == methodIndex;

    return Stack(
      alignment: Alignment.center,
      children: [
        IconButton(
          icon: Icon(
            iconData,
            color: (isSelected || methodIndex == null) ? Colors.black : Colors.grey,
          ),
          onPressed: () {
            setState(() {
              methodIndex = index;
              _updateMethodContent();
            });
          },
          color: isSelected ? Colors.black : Colors.transparent,
          iconSize: size,
          padding: EdgeInsets.all(10),
          splashRadius: 40,
          splashColor: Colors.grey.withOpacity(0.5),
          highlightColor: Colors.transparent,
        ),
      ],
    );
  }

  void _updateMethodContent() {
    //
  }
}


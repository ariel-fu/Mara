import 'package:flutter/material.dart';
import 'option_pages/pills.dart';

class OptionsPage extends StatefulWidget {
  const OptionsPage({super.key});

  @override
  State<OptionsPage> createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
  int _selectedIndex = 0;
  var _visited = <int>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Navigator.of(context).pushNamed('/');
            Navigator.of(context).pop();
          },
        ),
        title: Text('Options')
      ),
      body: SafeArea(
        child: Container(
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 300,
                left: 104,
                child: IconButtonExample(),
              ),
              // Positioned(
              //   top: 200,
              //   left: 200,
              //   child: IconButton(
              //     onPressed: () {},
              //     icon: Icon(Icons.emoji_food_beverage),  // replace with image
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

/* TODO - rename and convert to a custom placeable widget,
perhaps based on align
Move 'x' to the top right
*/
class IconButtonExample extends StatelessWidget {
  const IconButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              // onPressed: () => Navigator.pop(context, 'Next'),
              // TODO - pop the dialog here, or pop it from each subpage
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PillInfo()),
              ),
              child: const Text('Learn More'),
            ),
            IconButton(
              onPressed: () => Navigator.pop(context, 'Close'),
              icon: Icon(Icons.close),
            ),
          ],
        ),
      ),
      icon: Icon(Icons.house),  // replace with image
    );
  }
}

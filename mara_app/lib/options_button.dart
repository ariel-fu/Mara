import 'package:flutter/material.dart';
import 'option_pages/pills.dart';

/*
* Generates an icon button for the options page.
* size - desired size of the button
*/

// TODO - rename and convert to a custom placeable widget, perhaps based on align
// Move 'x' to the top right
class OptionsIconButton extends StatelessWidget {
  const OptionsIconButton({
    super.key,
    required this.icon,
    required this.size,
    required this.methodTitle,
    required this.description,
    this.destination = const PillInfo(),
  });

  final double size;
  final IconData icon;
  final String methodTitle;
  final String description;
  final Widget destination;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(methodTitle),
          content: Text(description),
          actions: <Widget>[
            TextButton(
              // onPressed: () => Navigator.pop(context, 'Next'),
              // TODO - pop the dialog here, or pop it from each subpage
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => destination),
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
      icon: Icon(icon, size: size),
    );
  }
}

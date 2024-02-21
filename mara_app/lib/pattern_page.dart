import 'package:flutter/material.dart';
import 'video.dart';

class PatternPage extends StatelessWidget {
  const PatternPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Bleeding Pattern Page')
      ),
      body: Center (
        child: VideoWidget(videoAsset: 'videos/funnyCat.mp4'),
      ),
      // body: VideoWidget(videoAsset: 'videos/funnyCat.mp4'),
      // body: Row(
      //   children: 
      //   [
      //     Text(
      //       'Bleeding Pattern Page',
      //       style: TextStyle(
      //         fontSize: 30,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //     VideoWidget(videoAsset: 'assets/video/funnyCat.mp4'),
      //   ]
      // ),
    );
  }
}
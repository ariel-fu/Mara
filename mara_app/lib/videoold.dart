// TODO Implement this library.

import 'package:flutter/material.dart';
import 'main.dart'; // Import your main.dart file
import 'package:video_player/video_player.dart';


//TO-DO: make video a separate widget that you could easily reference in any other file.
//video widget would have a asset parameter you would pass in, this would be unique to whatever video you want
//goal: make it as easy as possible to make many videos without having to re-use code (same goes for audio)

class VideoWidget extends StatefulWidget {
  final String videoAsset;
  const VideoWidget({Key? key, required this.videoAsset}) : super(key:key);
  @override
  State<VideoWidget> createState() => _VideoWidget();
}

class _VideoWidget extends State<VideoWidget> {
  late VideoPlayerController cat1;
  late VideoPlayerController cat2;

  @override
  void initState() {
    super.initState();

    cat1 = VideoPlayerController.asset(
      'assets/video/funnyCat.mp4',
    );

    cat2 = VideoPlayerController.asset(
      'assets/video/funnyCat2.mp4',
    );

    // Initialize asynchronously with error handling
    Future.wait([
      cat2.initialize().then((_) {
        // Handle completion for cat2
        setState(() {}); // Trigger rebuild to display video
      }).catchError((error) {
        // Handle errors for cat2
        print('Error initializing cat2: $error');
      }),
      cat1.initialize().then((_) {
        // Handle completion for cat1
        setState(() {}); // Trigger rebuild to display video
      }).catchError((error) {
        // Handle errors for cat1
        print('Error initializing cat1: $error');
      }),
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    //releasing resources
    cat2.dispose();
    cat1.dispose();
  }

  void _onPressedCat1() {
    setState(() {
      cat1.value.isPlaying ? cat1.pause() : cat1.play();
    });
  }

  void _onPressedCat2() {
    setState(() {
      cat2.value.isPlaying ? cat2.pause() : cat2.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Funny Cat Videos!'),
      ),
      body: Column(
        children: [
            Column(
              children: [
                Text('Cat With Red Bandana Has Fun', style: TextStyle(
                  fontSize: 18.0, fontWeight:FontWeight.bold
                ),),
                
                SizedBox(
                  width: 525,
                  height: 350,
                  child: VideoPlayer(cat1),
                ),
                
                IconButton(
                  icon: Icon(
                    cat1.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  ),
                  onPressed: () => _onPressedCat1(),
                  style: IconButton.styleFrom(
                  foregroundColor: Colors.lightBlue,
                  backgroundColor: Colors.grey[300],
                  ),
                ),

                VideoProgressIndicator(
                  cat1,
                  allowScrubbing: true, // Enable scrubbing for seeking
                  padding: const EdgeInsets.all(8.0),
                ),
              ],
            ),
            SizedBox(width: 40, height:40),
            Column(
              children: [
                Text('Black Cat With The Coolest Eyes', style: TextStyle(
                  fontSize: 18.0, fontWeight:FontWeight.bold
                )),

                SizedBox(
                  width: 525,
                  height: 350,
                  child: VideoPlayer(cat2),
                ),

                IconButton(
                  icon: Icon(
                    cat2.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  ),
                  onPressed: () => _onPressedCat2(),
                  style: IconButton.styleFrom(
                    foregroundColor: Colors.lightBlue,
                    backgroundColor: Colors.grey[300],
                  ),
                ),

                VideoProgressIndicator(
                  cat2,
                  allowScrubbing: true, // Enable scrubbing for seeking
                  padding: const EdgeInsets.all(8.0),
                ),
              ],
            ),
          ]),
      );
  }
}
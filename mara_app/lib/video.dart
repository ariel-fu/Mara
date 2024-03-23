import 'package:flutter/material.dart';
import 'main.dart'; // Import your main.dart file
import 'package:video_player/video_player.dart';


//make video a separate widget that you could easily reference in any other file.
//video widget would have a asset parameter you would pass in, this would be unique to whatever video you want
//goal: make it as easy as possible to make many videos without having to re-use code (same goes for audio)

class VideoWidget extends StatefulWidget {
  final String videoAsset;
  final String title;
  VideoWidget({Key? key, required this.videoAsset, required this.title}) : super(key:key);
  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController ourVideo;
  late Future<void> _initializeVideoPlayerFuture;
  @override
  void initState() {
    super.initState();
    ourVideo = VideoPlayerController.asset(widget.videoAsset);
    _initializeVideoPlayerFuture = ourVideo.initialize().catchError((error) {
      print('Error initializing video player: $error');
    });
  }

  @override
  void dispose() {
    //releasing resources
    ourVideo.dispose();
    super.dispose();
  }

  void _onPressedVideo() {
    setState(() {
      if (ourVideo.value.isPlaying) {
        ourVideo.pause();
      } else {
        ourVideo.play();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
                width: 350,
                height: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AspectRatio(
                      aspectRatio: ourVideo.value.aspectRatio,
                      child:Expanded(child: VideoPlayer(ourVideo)),
                    ),
                    Text(widget.title, style: TextStyle(
                        fontSize: 18.0, fontWeight:FontWeight.bold
                    ),),
                    FutureBuilder<void>(
                      future: _initializeVideoPlayerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return VideoProgressIndicator(
                            ourVideo,
                            allowScrubbing: true,
                            padding: const EdgeInsets.all(8.0),
                          );
                        } else {
                          return CircularProgressIndicator(); // or any other loading indicator
                        }
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        ourVideo.value.isPlaying ? Icons.pause : Icons.play_arrow,
                      ),
                      onPressed: () => _onPressedVideo(),
                      style: IconButton.styleFrom(
                        foregroundColor: Colors.lightBlue,
                        backgroundColor: Colors.grey[300],
                      ),
                    ),
                  ],
                )
            )
          )
        ],
      )
    );
  }
}
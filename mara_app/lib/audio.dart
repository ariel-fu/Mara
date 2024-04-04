import 'package:flutter/material.dart';
import 'main.dart'; // Import your main.dart file
import 'package:just_audio/just_audio.dart';

class AudioWidget extends StatefulWidget {
  @override
  final String audioAsset;
  AudioWidget({Key? key, required this.audioAsset}) : super(key:key);
  @override
  State<AudioWidget> createState() => _AudioWidgetState();
}

class _AudioWidgetState extends State<AudioWidget> {
  final AudioPlayer player1 = AudioPlayer();
  bool isPlaying1 = false;

  @override
  void dispose() {
    super.dispose();
    //releasing resources
    player1.dispose();
  }

  void _toggleAudio1() {
    setState(() {
      if (isPlaying1) {
        player1.pause();
      } else {
        //set it
        player1.setAsset(widget.audioAsset);
        player1.play();
      }
      setState(() {
        isPlaying1 = !isPlaying1; // Toggle play state
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Expanded(
        child: Row(
            children: [
              Text(' Listen Here: ', style: TextStyle(
                fontSize: 12.0)),
              IconButton(
                icon: Icon(isPlaying1 ? Icons.pause : Icons.play_arrow),
                onPressed: () => _toggleAudio1(),
                style: IconButton.styleFrom(
                  foregroundColor: Colors.lightBlue,
                  backgroundColor: Colors.grey[300],
                ),
              ),
          ]
        )
      )
    ); 
  }
}
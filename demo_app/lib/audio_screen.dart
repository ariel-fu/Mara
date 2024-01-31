import 'package:flutter/material.dart';
import 'main.dart'; // Import your main.dart file
import 'package:just_audio/just_audio.dart';

class AudioPage extends StatefulWidget {
  @override
  State<AudioPage> createState() => _AudioPage();
}

class _AudioPage extends State<AudioPage> {
  final AudioPlayer player1 = AudioPlayer();
  bool isPlaying1 = false;

  final AudioPlayer player2 = AudioPlayer();
  bool isPlaying2 = false;

  @override
  void dispose() {
    super.dispose();
    //releasing resources
    player1.dispose();
    player2.dispose();
  }

  Future<void> _toggleAudio1() async {
    if (isPlaying1) {
      await player1.pause();
      setState(() => isPlaying1 = false);
    } else {
      await player1.setAsset('assets/audio/purr.mp3');
      setState(() => isPlaying1 = true);
      await player1.play();
    }
  }

  Future<void> _toggleAudio2() async {
    if (isPlaying2) {
      await player2.pause();
      setState(() => isPlaying2 = false);
    } else {
      await player2.setAsset('assets/audio/meow.mp3');
      setState(() => isPlaying2 = true);
      await player2.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text('Cat Sounds!'),
      ),
      body: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text('Cats purr when they are happy!', style: TextStyle(
                        fontSize: 18.0, fontWeight:FontWeight.bold
                      ),),
                      Row (children: [
                        Text(' Listen Here: ', style: TextStyle(
                          fontSize: 18.0)),
                        IconButton(
                          icon: Icon(isPlaying1 ? Icons.pause : Icons.play_arrow),
                          onPressed: () async {
                            await _toggleAudio1();
                          },
                          style: IconButton.styleFrom(
                            foregroundColor: Colors.lightBlue,
                            backgroundColor: Colors.grey[300],
                          ),
                        ),
                      ])
                    ],
                  ),

                Text('For many years, researchers have been puzzled on how cats manage to generate the low-frequency vocalizations typically between 20 and 30 hertz (Hz)—involved in purring.'),

                SizedBox(width: 30, height: 50),

                Column(
                  children: [
                    Text('Cats make screechy meows when they are distressed!', style: TextStyle(
                      fontSize: 18.0, fontWeight:FontWeight.bold
                    ),),
                    Row (children: [
                      Text(' Listen Here: ', style: TextStyle(
                      fontSize: 18.0)),
                    
                      IconButton(
                        icon: Icon(isPlaying2 ? Icons.pause : Icons.play_arrow),
                        onPressed: () async {
                          await _toggleAudio2();
                        },
                        style: IconButton.styleFrom(
                          foregroundColor: Colors.lightBlue,
                          backgroundColor: Colors.grey[300],
                        ),
                      ),
                    ]),
                  ],
                ),
                Text('Why is your cat distressed? There are many, many factors that could have caused this. Perhaps you forgot to feed your cat lunch. Or, maybe your cat is just moody!'),
              ],   
            ),
        ),
      );
  }
}
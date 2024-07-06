import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mara_app/design/colors.dart';
import 'package:mara_app/session_manager.dart';
import 'main.dart'; // Import your main.dart file
import 'package:just_audio/just_audio.dart';

class AudioWidget extends StatefulWidget {
  @override
  final String audioAsset;

  AudioWidget({Key? key, required this.audioAsset}) : super(key: key);

  @override
  State<AudioWidget> createState() => _AudioWidgetState();
}

class _AudioWidgetState extends State<AudioWidget> {
  final AudioPlayer player1 = AudioPlayer();
  bool isPlaying1 = false;
  final double size = 60;
  DateTime? _startTime;
  StreamSubscription<PlayerState>? _playerStateSubscription;

  @override
  void dispose() {
    super.dispose();
    //releasing resources
    _playerStateSubscription?.cancel();

    player1.dispose();
  }

  void _toggleAudio1() {
    setState(() {
      if (isPlaying1) {
        int durationInSeconds =
            DateTime.now().difference(_startTime!).inSeconds;
        SessionManager.logAudioStop(
            widget.audioAsset, DateTime.now(), durationInSeconds);
        player1.pause();
      } else {
        //set it
        _startTime = DateTime.now();
        SessionManager.logAudioStart(widget.audioAsset, DateTime.now());
        player1.setAsset(widget.audioAsset);
        player1.play();

        // Add a listener to the player state
        _playerStateSubscription =
            player1.playerStateStream.listen((playerState) {
          // Check if the audio has finished playing
          if (playerState.processingState == ProcessingState.completed) {
            setState(() {
              isPlaying1 = false; // Update the play state
            });
          }
        });
      }
      setState(() {
        isPlaying1 = !isPlaying1; // Toggle play state
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset(
        isPlaying1
            ? "assets/audio/audio_pause.png"
            : "assets/audio/new_audio.png",
        width: size,
        height: size,
      ),
      onPressed: () => _toggleAudio1(),
    );
  }
}

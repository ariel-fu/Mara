import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  final String videoAsset;
  final String title;
  final VoidCallback? onVideoStart;
  final ValueChanged<int>? onVideoEnd;

  VideoWidget({
    Key? key,
    required this.videoAsset,
    required this.title,
    this.onVideoStart,
    this.onVideoEnd,
  }) : super(key: key);

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  DateTime? _startTime;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoAsset)
      ..addListener(() {
        if (_controller.value.position == Duration.zero && _startTime == null) {
          _startTime = DateTime.now();
          if (widget.onVideoStart != null) {
            widget.onVideoStart!();
          }
        }
        if (_controller.value.position == _controller.value.duration) {
          if (widget.onVideoEnd != null && _startTime != null) {
            int durationInSeconds = DateTime.now().difference(_startTime!).inSeconds;
            widget.onVideoEnd!(durationInSeconds);
          }
        }
      });
    _initializeVideoPlayerFuture = _controller.initialize().catchError((error) {
      print('Error initializing video player: $error');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant VideoWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.videoAsset != widget.videoAsset) {
      _controller.dispose();
      _controller = VideoPlayerController.asset(widget.videoAsset)
        ..addListener(() {
          if (_controller.value.position == Duration.zero && _startTime == null) {
            _startTime = DateTime.now();
            if (widget.onVideoStart != null) {
              widget.onVideoStart!();
            }
          }
          if (_controller.value.position == _controller.value.duration) {
            if (widget.onVideoEnd != null && _startTime != null) {
              int durationInSeconds = DateTime.now().difference(_startTime!).inSeconds;
              widget.onVideoEnd!(durationInSeconds);
            }
          }
        });
      _initializeVideoPlayerFuture = _controller.initialize().catchError((error) {
        print('Error initializing video player: $error');
      });
      setState(() {});
    }
  }

  void _onPressedVideo() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(child: VideoPlayer(_controller)),
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                ),
                FutureBuilder<void>(
                  future: _initializeVideoPlayerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return VideoProgressIndicator(
                        _controller,
                        allowScrubbing: true,
                        padding: const EdgeInsets.all(8.0),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
                IconButton(
                  icon: Icon(
                    _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  ),
                  onPressed: () => _onPressedVideo(),
                  style: IconButton.styleFrom(
                    foregroundColor: Colors.lightBlue,
                    backgroundColor: Colors.grey[300],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

library basick_video_player;

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BasickVideoPlayer extends StatefulWidget {
  final String videoUrl;

  final EdgeInsetsGeometry overAllPadding;

  final double sizedboxHeight;

  final BorderRadiusGeometry? clipBorder;

  final Color circularProgressIndicatorColor;

  const BasickVideoPlayer({
    super.key,
    required this.videoUrl,
    required this.overAllPadding,
    required this.sizedboxHeight,
    required this.circularProgressIndicatorColor,
    this.clipBorder,
  });

  @override
  State<BasickVideoPlayer> createState() => _BasickVideoPlayerState();
}

var videoFlag = false;

class _BasickVideoPlayerState extends State<BasickVideoPlayer> {
  late VideoPlayerController _videdoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _videdoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));

    _initializeVideoPlayerFuture =
        _videdoPlayerController.initialize().then((_) {
      _videdoPlayerController.play();
      _videdoPlayerController.setLooping(true);
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _videdoPlayerController.dispose();
    videoFlag = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: widget.overAllPadding,
          child: GestureDetector(
            onTap: () {
              setState(() {
                if (_videdoPlayerController.value.isPlaying) {
                  _videdoPlayerController.pause();
                  videoFlag = true;
                } else {
                  _videdoPlayerController.play();
                  videoFlag = false;
                }
              });
            },
            child: SizedBox(
              height: widget.sizedboxHeight,
              child: FutureBuilder(
                  future: _initializeVideoPlayerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return ClipRRect(
                        borderRadius:
                            widget.clipBorder ?? BorderRadius.circular(0),
                        child: AspectRatio(
                          aspectRatio:
                              16 / _videdoPlayerController.value.aspectRatio,
                          child: VideoPlayer(_videdoPlayerController),
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.black),
                      );
                    }
                  }),
            ),
          ),
        ),
      ),
    );
  }
}

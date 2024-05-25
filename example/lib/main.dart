import 'package:flutter/material.dart';
import 'package:basick_video_player/basick_video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BasickVideoPlayer(
        videoUrl:
            "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
        overAllPadding: const EdgeInsets.all(10),
        sizedboxHeight: 900,
        circularProgressIndicatorColor: Colors.black,
        clipBorder: BorderRadius.circular(20),
      ),
    );
  }
}

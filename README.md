<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

With the help of this Package, you can create a video player like YT shorts and play-pause your video.

## Getting started

You can use it easily! Just Import the package, and use it. You have some custom parameters to pass according to your needs you can change those.

```dart
BasickVideoPlayer(
        videoUrl:
            "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
        overAllPadding: const EdgeInsets.all(10),
        sizedboxHeight: 900,
        circularProgressIndicatorColor: Colors.black,
        clipBorder: BorderRadius.circular(20),
      ),
```

## Installation

First, add `basick_video_player` as a dependency

### iOS

If you need to access videos using `http` (rather than `https`) URLs, you will need to add
the appropriate `NSAppTransportSecurity` permissions to your app's _Info.plist_ file, located
in `<project root>/ios/Runner/Info.plist`. See
[Apple's documentation](https://developer.apple.com/documentation/bundleresources/information_property_list/nsapptransportsecurity)
to determine the right combination of entries for your use case and supported iOS versions.

### Android

If you are using network-based videos, ensure that the following permission is present in your
Android Manifest file, located in `<project root>/android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.INTERNET"/>
```

### macOS

If you are using network-based videos, you will need to [add the
`com.apple.security.network.client`
entitlement](https://docs.flutter.dev/platform-integration/macos/building#entitlements-and-the-app-sandbox)

### Web

> The Web platform does **not** support `dart:io`, so avoid using the `VideoPlayerController.file` constructor for the plugin. Using the constructor attempts to create a `VideoPlayerController.file` that will throw an `UnimplementedError`.

\* Different web browsers may have different video-playback capabilities (supported formats, autoplay...). Check [package:video_player_web](https://pub.dev/packages/video_player_web) for more web-specific information.

The `VideoPlayerOptions.mixWithOthers` option can't be implemented in web, at least at the moment. If you use this option in web it will be silently ignored.

## Supported Formats

-   On iOS and macOS, the backing player is [AVPlayer](https://developer.apple.com/documentation/avfoundation/avplayer).
    The supported formats vary depending on the version of iOS, [AVURLAsset](https://developer.apple.com/documentation/avfoundation/avurlasset) class
    has [audiovisualTypes](https://developer.apple.com/documentation/avfoundation/avurlasset/1386800-audiovisualtypes?language=objc) that you can query for supported av formats.
-   On Android, the backing player is [ExoPlayer](https://google.github.io/ExoPlayer/),
    please refer [here](https://google.github.io/ExoPlayer/supported-formats.html) for list of supported formats.
-   On Web, available formats depend on your users' browsers (vendor and version). Check [package:video_player_web](https://pub.dev/packages/video_player_web) for more specific information.

## Features

A Flutter widget that allows you to play and pause the video similar to YT shorts.
A Flutter plugin for iOS, Android and Web for playing back video on a Widget surface.

|             | Android | iOS   | macOS  | Web   |
| ----------- | ------- | ----- | ------ | ----- |
| **Support** | SDK 16+ | 12.0+ | 10.14+ | Any\* |

## Additional information

Author: Palash Dutta Banik
In a video player the basic need is the user can have the option to play and pause the video. So, here we go. We have added this fuctionality here.
Package Name: Basick Video Player

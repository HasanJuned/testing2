import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class PlayController extends GetxController {
  VideoPlayerController? controller;
  Future<void>? initializeVideoPlayerFuture;
  bool isPlaying = false;

  void setVideo(String assetPath) {
    controller = VideoPlayerController.asset(assetPath);
    initializeVideoPlayerFuture = controller!.initialize().then((_) {
      update(); // Notify listeners to update the UI
    });
    isPlaying = false; // Reset isPlaying status when a new video is set
    update();
  }

  void play() {
    controller?.play();
    isPlaying = true;
    update();
  }

  void pause() {
    controller?.pause();
    isPlaying = false;
    update();
  }
}

import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class PlayController extends GetxController{

  late VideoPlayerController? controller;
  //late Future<void>? initializeVideoPlayerFuture = controller?.initialize();
  bool? isPlay;

  void play(){
    controller?.pause();
    isPlay = false;
    update();
  }

  void pause(){
    controller?.play();
    isPlay = true;
    update();
  }





}
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:video_player/video_player.dart';

import '../ui/state_holders/play_controller.dart';

class VideoBoxWidget extends StatelessWidget {
  const VideoBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.brown, width: 3),
        color: Colors.black87.withOpacity(0.6),
      ),
      child: GetBuilder<PlayController>(
        builder: (playController) {
          if (playController.controller == null) {
            return const Center(
              child: Icon(
                Icons.play_arrow_outlined,
                size: 100,
                color: Colors.black,
              ),
            );
          }
          return InkWell(
            onTap: () {
              if (playController.controller!.value.isPlaying) {
                playController.pause();
              } else {
                playController.play();
              }
            },
            child: playController.isPlaying ? FutureBuilder(
              future: playController.initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return AspectRatio(
                    aspectRatio: playController.controller!.value.aspectRatio,
                    child: VideoPlayer(playController.controller!),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ) : const Icon(
              Icons.play_arrow_outlined,
              size: 100,
              color: Colors.black,
            ),
          );
        },
      ),
    );
  }
}

import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing2/presentation/state_holders/play_controller.dart';
import 'package:testing2/presentation/state_holders/uploaded_video_controller.dart';
import 'package:video_player/video_player.dart';

import '../data/utils/urls.dart';
import 'report_screen.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

PlayController playController = PlayController();
dynamic initializeVideoPlayerFuture;
bool isPlay = false;

class _VideoScreenState extends State<VideoScreen> {
  String? videoName = '';
  int? videoNumber = 1;

  @override
  void initState() {
    super.initState();
    Get.find<UploadedVideoController>().fetchAllVideo();
    playController.controller = VideoPlayerController.networkUrl(Uri.parse(
        'http://10.0.2.2:2001/flutterCourseByHasan/fetchVideo/663f4ddd54c21dabd09fdf77'));
    initializeVideoPlayerFuture = playController.controller?.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 100,
        title: const Text(
          'Videos',
          style: TextStyle(fontWeight: FontWeight.w500, letterSpacing: .1),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.brown, width: 3),
                color: Colors.black87,
              ),
              child: InkWell(
                  onTap: () {

                    if (playController.controller!.value.isPlaying) {
                      playController.play();
                      setState(() {

                      });

                    } else {
                      playController.pause();
                      setState(() {

                      });

                    }
                  },
                  child: playController.isPlay == false
                      ? FutureBuilder(
                          future: initializeVideoPlayerFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return AspectRatio(
                                aspectRatio: playController
                                    .controller!.value.aspectRatio,
                                child: VideoPlayer(playController.controller!),
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        )
                      : const Icon(
                          Icons.play_arrow_outlined,
                          size: 100,
                          color: Colors.white,
                        )),
            ),
            // VideoCard(
            //   videNumber: 1,
            //   videoName: '',
            // ),
            GetBuilder<UploadedVideoController>(
                builder: (uploadedVideoController) {
              if (uploadedVideoController.inProgress) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return VideoCard(
                videoName: '00',
                videoNumber: 1,
              );
            }),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.redAccent,
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16)),
                onPressed: () {
                  Get.to(() => ReportScreen());
                },
                child: const Text(
                  'Any Problem? Contact with us',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    //playController.controller?.dispose();
  }
}

class VideoCard extends StatefulWidget {
  VideoCard({super.key, this.videoName, this.videoNumber});

  String? videoName;
  int? videoNumber;
  UploadedVideoController? uploadedVideoController;

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    playController.controller = VideoPlayerController.networkUrl(Uri.parse(
        'http://10.0.2.2:2001/flutterCourseByHasan/fetchVideo/663f4ddd54c21dabd09fdf77'));
    initializeVideoPlayerFuture = playController.controller?.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UploadedVideoController>(
        builder: (uploadedVideoController) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '  Playing: ${widget.videoName}',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  letterSpacing: .1,
                ),
              ),
              Text(
                'Video: ${widget.videoNumber}/50  ',
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.blueGrey),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 285,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blueGrey, width: 2),
              color: Colors.grey.shade100,
            ),
            child: ListView.separated(
              itemCount:
                  uploadedVideoController.uploadedVideoModel.data!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    widget.videoName =
                        ' V-${index + 1} | ${uploadedVideoController.uploadedVideoModel.data?[index].fileType?.split('\\').last.split('_').elementAt(1).split('.').first}';
                    widget.videoNumber = index + 1;
                    playController.controller =
                        VideoPlayerController.networkUrl(Uri.parse(
                            Urls.playVideo(uploadedVideoController
                                .uploadedVideoModel.data?[index].sId)));
                    initializeVideoPlayerFuture =
                        playController.controller?.initialize();
                    setState(() {});
                  },
                  child: ListTile(
                    title: Text(
                      'V-${index + 1} |  ${uploadedVideoController.uploadedVideoModel.data?[index].fileType?.split('\\').last.split('_').elementAt(1).split('.').first}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        letterSpacing: .4,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 1,
                  thickness: 1.5,
                );
              },
            ),
          ),
        ],
      );
    });
  }
}

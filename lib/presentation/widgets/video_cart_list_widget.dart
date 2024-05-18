import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../data/utils/urls.dart';
import '../ui/state_holders/play_controller.dart';
import '../ui/state_holders/uploaded_video_controller.dart';
import 'video_box_widget.dart';

class VideoCartListWidget extends StatefulWidget {
  VideoCartListWidget({super.key, this.videoName, this.videoNumber});

  String? videoName;
  int? videoNumber;
  UploadedVideoController? uploadedVideoController;

  @override
  State<VideoCartListWidget> createState() => _VideoCartListWidgetState();
}

class _VideoCartListWidgetState extends State<VideoCartListWidget> {
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
                        Get.find<PlayController>().controller =
                            VideoPlayerController.networkUrl(Uri.parse(
                                Urls.playVideo(uploadedVideoController
                                    .uploadedVideoModel.data?[index].sId)));
                        Get.find<PlayController>().initializeVideoPlayerFuture =
                            Get.find<PlayController>().controller?.initialize();
                        VideoBoxWidget();
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

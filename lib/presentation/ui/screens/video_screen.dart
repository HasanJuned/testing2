import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:video_player/video_player.dart';

import '../../../data/utils/urls.dart';
import '../../widgets/video_box_widget.dart';
import '../../widgets/video_cart_list_widget.dart';
import '../state_holders/play_controller.dart';

import 'report_screen.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  String? videoName = '';
  int? videoNumber = 1;

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
            VideoBoxWidget(),
            VideoCartListWidget(
              videoName: '00',
              videoNumber: 1,
            ),
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

}

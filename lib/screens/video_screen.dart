import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.brown, width: 3),
                color: Colors.black87,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.black87,
                radius: 90,
                child: InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.play_arrow,
                      size: 50,
                      color: Colors.white,
                    )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '  Playing: $videoName',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    letterSpacing: .1,
                  ),
                ),
                Text(
                  'Video: $videoNumber/50  ',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.blueGrey
                  ),
                ),
              ],
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
                itemCount: 50,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      videoName = ' V-${index + 1} | AppBar';
                      videoNumber = index + 1;
                      setState(() {});
                    },
                    child: ListTile(
                      title: Text(
                        'V-${index + 1} | AppBar',
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
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.redAccent,
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 16)),
                onPressed: () {
                 Get.to(()=> ReportScreen());
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

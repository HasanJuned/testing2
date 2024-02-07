import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:testing2/group_join.dart';

import 'model.dart';
import 'network_utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImageUploader(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Model model = Model();
  GroupJoin groupJoin = GroupJoin();
  bool inProgress = false;

  Future<void> completedNewTasks() async {
    inProgress = true;
    setState(() {});
    final response = await NetworkUtils().getMethod(
        'http://10.0.2.2:2006/api/teacher/availableCourseAndTeacher');

    if (response != null) {
      model = Model.fromJson(response);
    } else {
      if (mounted) {
        print('unable');
      }
    }
    inProgress = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    completedNewTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Course & Teacher'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ListView.separated(
              itemCount: model.data?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  tileColor: Colors.grey.shade300,
                  title: Text('Batch: ${model.data?[index].batch ?? ''}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Text('Section: ${model.data?[index].section ?? ''}'),
                      const SizedBox(
                        height: 4,
                      ),
                      Text('Subject: ${model.data?[index].courseTitle ?? ''}'),
                      const SizedBox(
                        height: 4,
                      ),
                      Text('Teacher: ${model.data?[index].email ?? ''}'),
                      const SizedBox(
                        height: 4,
                      ),
                    ],
                  ),
                  trailing: ElevatedButton(
                      onPressed: () async {
                        final result = await NetworkUtils().postMethod(
                          'http://10.0.2.2:2006/api/teacher/createGroup',
                          body: {
                            "batch": "57",
                            "section": "A",
                            "courseCode": "eee-4111",
                            "courseTitle": "OOP",
                            "member": {
                              "name": "1234560",
                              "batch": "cse",
                              "department": "cse",
                              "section": "a"
                            }
                          },
                        );
                      },
                      child: Text('Join')),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: 6,
                  height: 12,
                  color: Colors.indigo.shade100,
                );
              }),
        ),
      ),
    );
  }
}

class ImageUploader extends StatefulWidget {
  const ImageUploader({super.key});

  @override
  State<ImageUploader> createState() => _ImageUploaderState();
}

class _ImageUploaderState extends State<ImageUploader> {

  XFile? pickedImage;
  String? imageUrl;
  String? fileName;


  /// Image pick from gallery
  Future<void> imagePickerFunction() async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Pick Image from'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text('Gallery'),
                  leading: const Icon(Icons.image),
                  onTap: () async {
                    pickedImage = await ImagePicker()
                        .pickImage(source: ImageSource.camera);
                    log(pickedImage!.path);

                    if (pickedImage == null) {
                      return;
                    }

                    fileName = DateTime.now().millisecondsSinceEpoch.toString();
                  },
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Uploader"),
      ),
      
      body: Center(
        child: ElevatedButton(onPressed: (){
          imagePickerFunction();



        }, child: Text('Upload')),
      ),
    );
  }
}


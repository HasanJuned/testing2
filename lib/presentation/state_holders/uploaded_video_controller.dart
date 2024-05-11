import 'package:get/get.dart';
import 'package:testing2/data/model/uploaded_video_model.dart';

import '../../data/model/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';

class UploadedVideoController extends GetxController {
  bool _inProgress = false;
  String _message = '';
  UploadedVideoModel _uploadedVideoModel = UploadedVideoModel();
  //List<Data> videoList = [];

  bool get inProgress => _inProgress;
  String get message => _message;
  UploadedVideoModel get uploadedVideoModel => _uploadedVideoModel;

  Future<bool> fetchAllVideo() async {
    _inProgress = true;
    update();
    final NetworkResponse response =
    await NetworkCaller.getRequest(Urls.fetchAllVideo);
    _inProgress = false;
    update();

    if (response.isSuccess) {
      _uploadedVideoModel = UploadedVideoModel.fromJson(response.responseJson!);
      // videoList.addAll(_uploadedVideoModel.data!);
      // print('list is : ${videoList.map((e) => e.toJson()).toList()}');
      return true;
    } else {
      _message = 'fail';
      return false;
    }
  }
}

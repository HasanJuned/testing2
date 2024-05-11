import 'package:get/get.dart';
import '../presentation/state_holders/uploaded_video_controller.dart';

class GetXBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(UploadedVideoController());
  }
}

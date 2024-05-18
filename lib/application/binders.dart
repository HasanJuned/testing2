import 'package:get/get.dart';
import 'package:testing2/presentation/state_holders/play_controller.dart';
import '../presentation/state_holders/uploaded_video_controller.dart';

class GetXBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlayController());
    Get.lazyPut(() => UploadedVideoController());
  }
}

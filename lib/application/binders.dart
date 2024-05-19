import 'package:get/get.dart';

import '../presentation/ui/state_holders/play_controller.dart';

class GetXBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlayController());
    //Get.lazyPut(() => UploadedVideoController());
  }
}

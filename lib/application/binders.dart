import 'package:get/get.dart';
import 'package:testing2/presentation/ui/state_holders/login_controller.dart';
import 'package:testing2/presentation/ui/state_holders/sign_up_controller.dart';
import '../presentation/ui/state_holders/play_controller.dart';

class GetXBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlayController());
    Get.lazyPut(() => SignUpController());
    Get.lazyPut(() => LoginController());
  }
}

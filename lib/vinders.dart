import 'package:get/get.dart';

import 'network_caller.dart';

class GetXBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(() => FacRegistrationController());
  }
}
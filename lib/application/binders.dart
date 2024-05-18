
import 'package:get/get.dart';
import 'package:testing2/presentation/state_holders/weather_data_controller.dart';

class GetXBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WeatherDataController());
  }
}
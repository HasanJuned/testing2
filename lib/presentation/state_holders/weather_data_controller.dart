import 'package:get/get.dart';
import 'package:testing2/data/model/weather_model.dart';
import 'package:testing2/data/services/network_caller.dart';

import '../../data/utils/urls.dart';

class WeatherDataController extends GetxController {
  bool _inProgress = false;
  WeatherModel _weatherModel = WeatherModel();

  bool get inProgress => _inProgress;
  WeatherModel get weatherModel => _weatherModel;

  Future<bool> fetchWeatherData() async {
    _inProgress = true;
    update();

    final response = await NetworkCaller.getRequest(Urls.weatherUrl);

    _inProgress = false;
    update();

    if (response.statusCode == 200) {
      _weatherModel = WeatherModel.fromJson(response.responseJson!);
      return true;
    } else {
      return false;
    }
  }
}

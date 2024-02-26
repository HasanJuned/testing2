import 'package:intl/intl.dart';

/// model / pojo class -> helper between application and api
class WeatherData {
  final String location;
  final String temperature; /// 6.7
  final String weatherDescription;
  final String weatherImage;
  final String updatedTime;
  final String minTemperature;
  final String maxTemperature;

  WeatherData({
    required this.location,
    required this.temperature,
    required this.weatherDescription,
    required this.weatherImage,
    required this.updatedTime,
    required this.minTemperature,
    required this.maxTemperature,
  });

  /// link
  ///
  /// get

  /// factory constructor
  factory WeatherData.fromJson(Map<String, dynamic> json) {
    final weather = json['weather'][0];
    final iconCode = weather['icon'];
    final temperature = (json['main']['temp'] - 273.15).toStringAsFixed(1); /// 278 - 273 = 6.7
    final minTemperature = (json['main']['temp_min'] - 273.15).toStringAsFixed(1);
    final maxTemperature = (json['main']['temp_max'] - 273.15).toStringAsFixed(1);
    final currentTime = DateTime.now(); /// system teke current 9.29 PM
    final updatedTime = DateFormat('h:mm a').format(currentTime);
    //final updatedTime = '${currentTime.hour.toString().padLeft(2, '0')}:${currentTime.minute.toString().padLeft(2, '0')}';

    return WeatherData(
      location: json['name'],
      temperature: temperature, /// 6.7
      weatherDescription: weather['main'],
      minTemperature: minTemperature,
      maxTemperature: maxTemperature,
      weatherImage:
      'https://openweathermap.org/img/w/$iconCode.png',
      updatedTime: updatedTime,
    );
  }

}
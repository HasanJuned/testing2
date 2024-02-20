import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'model.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherPage(),
    );
  }
}



class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  bool isLoading = true;
  bool isError = false;
  WeatherData? weatherData;

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    try {

      /// step 0
      final url = 'https://api.openweathermap.org/data/2.5/weather?q=Boise&appid=0dadc0ec41869d72cab605ebf70d5c96';

      /// 1st uri
      final response = await get(Uri.parse(url)); /// get request y/n


      /// 2nd response anyhting from server y == 200 / n == else

      if (response.statusCode == 200) { // yes / ok /success

        final jsonData = json.decode(response.body);

        weatherData = WeatherData.fromJson(jsonData);
        print(response.body);
        isLoading = false;

        setState(() {});

      } else {
        setState(() {
          isError = true;
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isError = true;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.deepPurple[900]!, Colors.deepPurple[200]!],
          ),
        ),
        child: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : isError
              ? Text('Error fetching weather data')
              : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
               weatherData!.location,
                style: TextStyle(
                    fontSize: 34,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(width: 8),
              Text(
                'Updated: ${weatherData!.updatedTime}',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              Container(
                child: CachedNetworkImage(
                  height: 100,
                  width: 100,
                  imageUrl: weatherData!.weatherImage,
                  placeholder: (context, url) =>
                      CircularProgressIndicator(),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.error),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              Text(
                '${weatherData!.temperature}°C',
                style: TextStyle(
                  fontSize: 48,
                  color: Colors.white,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/down-arrow.svg',
                    width: 20,
                    height: 20,
                    color: Colors.white,
                  ),
                  SizedBox(width: 8),
                  Text(
                    '${weatherData!.maxTemperature}°C',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 16),
                  SvgPicture.asset(
                    'assets/icons/down_arrow.svg',
                    width: 20,
                    height: 20,
                    color: Colors.white,
                  ),
                  SizedBox(width: 8),
                  Text(
                    '${weatherData!.minTemperature}°C',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                weatherData!.weatherDescription,
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'CustomFont',
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
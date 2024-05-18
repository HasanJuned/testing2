import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class WeatherService {
  final String apiKey = '39ac2de89e032bd84c5974aeff8bd863';
  final String apiUrl = 'http://api.openweathermap.org/data/2.5/weather';

  Future<Map<String, dynamic>> fetchWeather(String city) async {
    final response = await http.get(Uri.parse('$apiUrl?q=$city&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherService _weatherService = WeatherService();
  final TextEditingController _cityController = TextEditingController();

  Map<String, dynamic>? _weatherData;
  bool _isLoading = false;

  void _fetchWeather() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final weatherData = await _weatherService.fetchWeather(_cityController.text);
      setState(() {
        _weatherData = weatherData;
      });
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Enter city',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _fetchWeather,
              child: Text('Get Weather'),
            ),
            SizedBox(height: 16),
            _isLoading
                ? CircularProgressIndicator()
                : _weatherData != null
                ? Column(
              children: [
                Text(
                  'City: ${_weatherData!['name']}',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Temperature: ${_weatherData!['main']['temp']}°C',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Weather: ${_weatherData!['weather'][0]['description']}',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            )
                : Text('Enter a city name and press the button'),
          ],
        ),
      ),
    );
  }
}

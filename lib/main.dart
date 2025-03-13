import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing2/game_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GameController _gameController = Get.put(GameController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () {
              return Text('My Choice: ${_gameController.userChoice.value}');
            },
          ),
          SizedBox(
            height: 10,
          ),
          Obx(
            () {
              return Text(
                  'Computer Choice: ${_gameController.computerChoice.value}');
            },
          ),
          SizedBox(
            height: 10,
          ),
          Obx(
            () {
              return Text('My Choice: ${_gameController.result.value}');
            },
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _gameController.choices
                .map((choice) => ElevatedButton(
                      onPressed: () => _gameController.playGame(choice),
                      child: Text(choice),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

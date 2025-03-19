import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PollingApp(),
    );
  }
}

class PollingApp extends StatefulWidget {
  const PollingApp({super.key});

  @override
  State<PollingApp> createState() => _PollingAppState();
}

class _PollingAppState extends State<PollingApp> {
  String? selectedOption;


  Map<String, dynamic> pollOptions = {
    'Flutter': 0,
    'Java': 0,
    'React Native': 0,
  };

  void voteCalculation() {
    pollOptions[selectedOption!]++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vote'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Vote your favorite option'),


              ...pollOptions.keys.map((options) {
                return RadioListTile(
                    title: Text(options),
                    value: options,
                    groupValue: selectedOption,
                    onChanged: (value) {
                      selectedOption = value;
                      /// voteCalculation();
                      setState(() {});
                    });
              }),
              ElevatedButton(
                onPressed: () {
                  voteCalculation();
                },
                child: const Text('Result'),
              ),

              ...pollOptions.entries.map((value){
                return Text('${value.key}: ${value.value}' );
              })
            ],
          ),
        ),
      ),
    );
  }
}

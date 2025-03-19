import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Polling App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PollingPage(),
    );
  }
}

class PollingPage extends StatefulWidget {
  @override
  _PollingPageState createState() => _PollingPageState();
}

class _PollingPageState extends State<PollingPage> {
  String? selectedOption;
  Map<String, int> pollResults = {
    'Option 1': 0,
    'Option 2': 0,
    'Option 3': 0,
    'Option 4': 0,
  };

  void submitVote() {
    if (selectedOption != null) {
      setState(() {
        pollResults[selectedOption!] = pollResults[selectedOption!]! + 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Polling App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Vote for your favorite option:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ...pollResults.keys.map((option) {
              return RadioListTile<String>(
                title: Text(option),
                value: option,
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value;
                  });
                },
              );
            }).toList(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: submitVote,
              child: Text('Submit Vote'),
            ),
            SizedBox(height: 40),
            Text(
              'Poll Results:',
              style: TextStyle(fontSize: 18),
            ),
            ...pollResults.entries.map((entry) {
              return Text(
                '${entry.key}: ${entry.value} votes',
                style: TextStyle(fontSize: 16),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

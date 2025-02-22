import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController();
  String fromUnit = 'Meters'; /// Set default unit
  String toUnit = 'Kilometers'; /// Set default unit
  double result = 0.0;

  final Map<String, double> convertionTypes = {
    'Meters': 1.0,
    'Kilometers': 0.001,
    'Centimeters': 100,
    'Inches': 39.37,
    'Feet': 3.28084
  };

  void convert() {
    double input = double.tryParse(controller.text) ?? 0;
    if (input > 0) {
      result = input * (convertionTypes[toUnit]! / convertionTypes[fromUnit]!);
    } else {
      result = 0.0;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unit Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter value',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: fromUnit,
                  onChanged: (value) {
                    setState(() {
                      fromUnit = value!;
                    });
                  },
                  items: convertionTypes.keys.map((unit) {
                    return DropdownMenuItem(
                      value: unit,
                      child: Text(unit),
                    );
                  }).toList(),
                ),
                Text('to'),
                DropdownButton<String>(
                  value: toUnit,
                  onChanged: (value) {
                    setState(() {
                      toUnit = value!;
                    });
                  },
                  items: convertionTypes.keys.map((unit) {
                    return DropdownMenuItem(
                      value: unit,
                      child: Text(unit),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (controller.text.isNotEmpty) {
                    convert();
                  }
                },
                child: Text('Convert'),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Result: $result',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

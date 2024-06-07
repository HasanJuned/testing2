import 'dart:convert';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage2 extends StatefulWidget {
  @override
  _MyHomePage2State createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {
  List<List<dynamic>> _filteredValues = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final _rawData = await rootBundle.loadString('assets/wednesday.csv');
    List<List<dynamic>> _listData =
    const CsvToListConverter().convert(_rawData);

    _filteredValues = _listData.where((row) {
      // Check each cell in the row for the value 'PRP'
      return row.any((cell) => cell.toString().contains('ASD'));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Google Sheets'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Center(
          child: SingleChildScrollView(
            child: Table(
              border: TableBorder.all(),
              children: _filteredValues.map((row) {
                return TableRow(
                  children: row.map((cell) {
                    return SubjectClass(
                      title: cell.toString() == '60' ? cell.toString() : 'not found',
                      color: Colors.black,
                    );
                  }).toList(),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class SubjectClass extends StatelessWidget {
  const SubjectClass({
    required this.title,
    required this.color,
  });

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          title,
          style: TextStyle(
            overflow: TextOverflow.visible,
            fontSize: 12.23,
            fontWeight: FontWeight.w600,
            letterSpacing: .1,
            color: color,
          ),
        ),
      ),
    );
  }
}

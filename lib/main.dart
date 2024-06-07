import 'dart:convert';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Sheets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<List<dynamic>> _values = [];
  List<List<dynamic>> _values2 = [];
  List<List<dynamic>> _values3 = [];
  List<List<dynamic>> _values4 = [];
  List<List<dynamic>> _values5 = [];
  List<List<dynamic>> _values6 = [];
  List<List<dynamic>> _values7 = [];

  List<dynamic>? jSat = [];
  List<dynamic>? jSun = [];
  List<dynamic>? jMon = [];
  List<dynamic>? jTue = [];
  List<dynamic>? jWed = [];
  List<dynamic>? jThu = [];
  List<dynamic>? jFri = [];


  List<List<dynamic>> _filteredValues = [];
  List<List<dynamic>> _filteredValues2 = [];
  List<List<dynamic>> _filteredValues3 = [];
  List<List<dynamic>> _filteredValues4 = [];
  List<List<dynamic>> _filteredValues5 = [];
  List<List<dynamic>> _filteredValues6 = [];
  List<List<dynamic>> _filteredValues7 = [];

  List<String> days = ['SAT', 'SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI'];
  String batchToFilter = '58';
  String sectionToFilter = 'B+C';

  String? one;
  String? one2;
  String? one3;
  String? one4;
  String? one5;
  String? one6;
  String? one7;

  String? two;
  String? two2;
  String? two3;
  String? two4;
  String? two5;
  String? two6;
  String? two7;

  String? three;
  String? three2;
  String? three3;
  String? three4;
  String? three5;
  String? three6;
  String? three7;

  String? four;
  String? four2;
  String? four3;
  String? four4;
  String? four5;
  String? four6;
  String? four7;

  String? five;
  String? five2;
  String? five3;
  String? five4;
  String? five5;
  String? five6;
  String? five7;

  String? six;
  String? six2;
  String? six3;
  String? six4;
  String? six5;
  String? six6;
  String? six7;

  String? seven;
  String? seven2;
  String? seven3;
  String? seven4;
  String? seven5;
  String? seven6;
  String? seven7;

  String? eight;
  String? eight2;
  String? eight3;
  String? eight4;
  String? eight5;
  String? eight6;
  String? eight7;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final _rawData = await rootBundle.loadString('assets/my_csv.csv');
    final _rawData2 = await rootBundle.loadString('assets/monday.csv');
    final _rawData3 = await rootBundle.loadString('assets/tuesday.csv');
    final _rawData4 = await rootBundle.loadString('assets/wednesday.csv');
    final _rawData5 = await rootBundle.loadString('assets/thursday.csv');
    final _rawData6 = await rootBundle.loadString('assets/friday.csv');
    final _rawData7 = await rootBundle.loadString('assets/saturday.csv');

    List<List<dynamic>> _listData =
    const CsvToListConverter().convert(_rawData);
    List<List<dynamic>> _listData2 =
    const CsvToListConverter().convert(_rawData2);
    List<List<dynamic>> _listData3 =
    const CsvToListConverter().convert(_rawData3);
    List<List<dynamic>> _listData4 =
    const CsvToListConverter().convert(_rawData4);
    List<List<dynamic>> _listData5 =
    const CsvToListConverter().convert(_rawData5);
    List<List<dynamic>> _listData6 =
    const CsvToListConverter().convert(_rawData6);
    List<List<dynamic>> _listData7 =
    const CsvToListConverter().convert(_rawData7);

    _filteredValues = _listData.where((row) {
      return row.isNotEmpty &&
          row[1].toString() == batchToFilter &&
          row[2].toString() == sectionToFilter;
    }).toList();

    _filteredValues2 = _listData2.where((row) {
      return row.isNotEmpty &&
          row[1].toString() == batchToFilter &&
          row[2].toString() == sectionToFilter;
    }).toList();

    _filteredValues3 = _listData3.where((row) {
      return row.isNotEmpty &&
          row[1].toString() == batchToFilter &&
          row[2].toString() == sectionToFilter;
    }).toList();

    _filteredValues4 = _listData4.where((row) {
      return row.isNotEmpty &&
          row[1].toString() == batchToFilter &&
          row[2].toString() == sectionToFilter;
    }).toList();

    _filteredValues5 = _listData5.where((row) {
      return row.isNotEmpty &&
          row[1].toString() == batchToFilter &&
          row[2].toString() == sectionToFilter;
    }).toList();

    _filteredValues6 = _listData6.where((row) {
      return row.isNotEmpty &&
          row[1].toString() == batchToFilter &&
          row[2].toString() == sectionToFilter;
    }).toList();

    _filteredValues7 = _listData7.where((row) {
      return row.isNotEmpty &&
          row[1].toString() == batchToFilter &&
          row[2].toString() == sectionToFilter;
    }).toList();

    if (_filteredValues.isNotEmpty) {
      if (_filteredValues[0].length > 10) {
        one = _filteredValues[0][3];
        two = _filteredValues[0][4];
        three = _filteredValues[0][5];
        four = _filteredValues[0][6];
        five = _filteredValues[0][7];
        six = _filteredValues[0][8];
        seven = _filteredValues[0][9];
        eight = _filteredValues[0][10];
      }
    }

    if (_filteredValues2.isNotEmpty) {
      if (_filteredValues2[0].length > 10) {
        one2 = _filteredValues2[0][3];
        two2 = _filteredValues2[0][4];
        three2 = _filteredValues2[0][5];
        four2 = _filteredValues2[0][6];
        five2 = _filteredValues2[0][7];
        six2 = _filteredValues2[0][8];
        seven2 = _filteredValues2[0][9];
        eight2 = _filteredValues2[0][10];
      }
    }

    if (_filteredValues3.isNotEmpty) {
      if (_filteredValues3[0].length > 10) {
        one3 = _filteredValues3[0][3];
        two3 = _filteredValues3[0][4];
        three3 = _filteredValues3[0][5];
        four3 = _filteredValues3[0][6];
        five3 = _filteredValues3[0][7];
        six3 = _filteredValues3[0][8];
        seven3 = _filteredValues3[0][9];
        eight3 = _filteredValues3[0][10];
      }
    }

    if (_filteredValues4.isNotEmpty) {
      if (_filteredValues4[0].length > 10) {
        one4 = _filteredValues4[0][3];
        two4 = _filteredValues4[0][4];
        three4 = _filteredValues4[0][5];
        four4 = _filteredValues4[0][6];
        five4 = _filteredValues4[0][7];
        six4 = _filteredValues4[0][8];
        seven4 = _filteredValues4[0][9];
        eight4 = _filteredValues4[0][10];
      }
    }

    if (_filteredValues5.isNotEmpty) {
      if (_filteredValues5[0].length > 10) {
        one5 = _filteredValues5[0][3];
        two5 = _filteredValues5[0][4];
        three5 = _filteredValues5[0][5];
        four5 = _filteredValues5[0][6];
        five5 = _filteredValues5[0][7];
        six5 = _filteredValues5[0][8];
        seven5 = _filteredValues5[0][9];
        eight5 = _filteredValues5[0][10];
      }
    }

    if (_filteredValues6.isNotEmpty) {
      if (_filteredValues6[0].length > 10) {
        one6 = _filteredValues6[0][3];
        two6 = _filteredValues6[0][4];
        three6 = _filteredValues6[0][5];
        four6 = _filteredValues6[0][6];
        five6 = _filteredValues6[0][7];
        six6 = _filteredValues6[0][8];
        seven6 = _filteredValues6[0][9];
        eight6 = _filteredValues6[0][10];
      }
    }

    if (_filteredValues7.isNotEmpty) {
      if (_filteredValues7[0].length > 10) {
        one7 = _filteredValues7[0][3];
        two7 = _filteredValues7[0][4];
        three7 = _filteredValues7[0][5];
        four7 = _filteredValues7[0][6];
        five7 = _filteredValues7[0][7];
        six7 = _filteredValues7[0][8];
        seven7 = _filteredValues7[0][9];
        eight7 = _filteredValues7[0][10];
      }
    }

    jSun = [one, two, three, four, five, six, seven, eight];
    jMon = [one2, two2, three2, four2, five2, six2, seven2, eight2];
    jTue = [one3, two3, three3, four3, five3, six3, seven3, eight3];
    jWed = [one4, two4, three4, four4, five4, six4, seven4, eight4];
    jThu = [one5, two5, three5, four5, five5, six5, seven5, eight5];
    jFri = [one6, two6, three6, four6, five6, six6, seven6, eight6];
    jSat = [one7, two7, three7, four7, five7, six7, seven7, eight7];

    print('kiu ${jSun}');
    // print('kiu $j2');
    // print('kiu $j3');
    // print('kiu $j4');
    // print('kiu $j5');
    // print('kiu $j6');
    // print('kiu $j7');
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
          child: Table(
            border: TableBorder.all(),
            children:  [
              const TableRow(
                children: [
                  SubjectClass(
                    title: 'Time\nDay',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '8:55\nto\n9:45\nAM',
                    color: Colors.red,
                  ),
                  SubjectClass(
                    title: '9:50\nto\n10:40\nAM',
                    color: Colors.red,
                  ),
                  SubjectClass(
                    title: '10:45\nto\n11:35\nAM',
                    color: Colors.red,
                  ),
                  SubjectClass(
                    title: '11:40\nto\n12:30\nPM',
                    color: Colors.red,
                  ),
                  SubjectClass(
                    title: '12:35\nto\n1:25\nPM',
                    color: Colors.red,
                  ),
                  SubjectClass(
                    title: '1:30\nto\n2:10\nPM',
                    color: Colors.red,
                  ),
                  SubjectClass(
                    title: '2:15\nto\n3.05\nPM',
                    color: Colors.red,
                  ),
                  SubjectClass(
                    title: '3:10\nto\n4.00\nPM',
                    color: Colors.red,
                  ),
                ],
              ),

              TableRow(
                children: [
                  const SubjectClass(
                    title: 'SAT',
                    color: Colors.red,
                  ),
                  SubjectClass(
                    title: '$one7',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$two7',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$three7',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$four7',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$five7',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$six7',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$seven7',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$eight7',
                    color: Colors.black,
                  ),
                ],
              ),
              TableRow(
                children: [
                  const SubjectClass(
                    title: 'SUN',
                    color: Colors.red,
                  ),
                  SubjectClass(
                    title: '$one',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$two',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$three',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$four',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$five',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$six',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$seven',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$eight',
                    color: Colors.black,
                  ),
                ],
              ),
              TableRow(
                children: [
                  const SubjectClass(
                    title: 'MON',
                    color: Colors.red,
                  ),
                  SubjectClass(
                    title: '$one2',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$two2',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$three2',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$four2',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$five2',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$six2',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$seven2',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$eight2',
                    color: Colors.black,
                  ),
                ],
              ),
              TableRow(
                children: [
                  const SubjectClass(
                    title: 'TUE',
                    color: Colors.red,
                  ),
                  SubjectClass(
                    title: '$one3',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$two3',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$three3',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$four3',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$five3',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$six3',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$seven3',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$eight3',
                    color: Colors.black,
                  ),
                ],
              ),TableRow(
                children: [
                  const SubjectClass(
                    title: 'WED',
                    color: Colors.red,
                  ),
                  SubjectClass(
                    title: '$one4',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$two4',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$three4',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$four4',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$five4',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$six4',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$seven4',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$eight4',
                    color: Colors.black,
                  ),
                ],
              ),TableRow(
                children: [
                  const SubjectClass(
                    title: 'THU',
                    color: Colors.red,
                  ),
                  SubjectClass(
                    title: '$one5',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$two5',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$three5',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$four5',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$five5',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$six5',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$seven5',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$eight5',
                    color: Colors.black,
                  ),
                ],
              ),TableRow(
                children: [
                  const SubjectClass(
                    title: 'FRI',
                    color: Colors.red,
                  ),
                  SubjectClass(
                    title: '$one6',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$two6',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$three6',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$four6',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$five6',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$six6',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$seven6',
                    color: Colors.black,
                  ),
                  SubjectClass(
                    title: '$eight6',
                    color: Colors.black,
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class SubjectClass extends StatelessWidget {
  const SubjectClass({
    super.key,
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

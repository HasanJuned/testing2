import 'dart:convert';
import 'package:flutter/material.dart';
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
  List<dynamic> j = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final url =
        'https://docs.google.com/spreadsheets/d/1iwZbuHU3idcxRA7GzF8aoSZOBIiH654mK_RmCGdGIAw/gviz/tq?tqx=out:json&gid=712672084';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonString = response.body
          .replaceFirst("/*O_o*/", "")
          .replaceFirst("google.visualization.Query.setResponse(", "")
          .replaceFirst(");", "");
      final jsonResponse = json.decode(jsonString);

      final rows = jsonResponse['table']['rows'];
      final List<List<dynamic>> values = rows.map<List<dynamic>>((row) {
        return (row['c'] as List?)
                ?.map<dynamic>((cell) => cell?['v'] ?? "")
                .toList() ??
            [];
      }).toList();

      setState(() {
        _values = values;
      });
      print(_values[6]);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Google Sheets'),
      ),
      // body: _values.isEmpty
      //     ? Center(child: CircularProgressIndicator())
      //     : ListView.builder(
      //   itemCount: _values.length,
      //   itemBuilder: (context, index) {
      //     final row = _values[index];
      //
      //     if (row.length > 1) {
      //       return ListTile(
      //         title: Text('${_values[6][6]}, ${_values[6][9]}'), // Display only time information, excluding the first two columns
      //       );
      //     } else {
      //       return SizedBox.shrink(); // Return an empty widget if the row does not contain time information
      //     }
      //   },
      // ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Table(
              border: TableBorder.all(), // Optional: Adds borders to the table
              children: [
                TableRow(
                  children: [
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(
                          'Time\nDay',
                          style: TextStyle(
                              overflow: TextOverflow.visible,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              letterSpacing: .1,
                              color: Colors.blue),
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('8:55\nto\n9:45\nAM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('9:50\nto\n10:40\nAM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('10:45\nto\n11:35\nAM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('11:40\nto\n12:30\nPM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('8:55\nto\n12:45\nAM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('12:35\nto\n1:25\nPM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('1:30\nto\n2:10\nPM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('2:15\nto\n3.05\nPM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('3:10\nto\n4.00\nPM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(
                          'SAT',
                          style: TextStyle(
                              overflow: TextOverflow.visible,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              letterSpacing: .1,
                              color: Colors.red),
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text('${_values[3][9]}',
                            style: const TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.black)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('9:50\nto\n10:40\nAM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('10:45\nto\n11:35\nAM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('11:40\nto\n12:30\nPM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('8:55\nto\n12:45\nAM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('12:35\nto\n1:25\nPM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('1:30\nto\n2:10\nPM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('2:15\nto\n3.05\nPM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('3:10\nto\n4.00\nPM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(
                          'SUN',
                          style: TextStyle(
                              overflow: TextOverflow.visible,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              letterSpacing: .1,
                              color: Colors.red),
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('8:55\nto\n9:45\nAM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('9:50\nto\n10:40\nAM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('10:45\nto\n11:35\nAM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('11:40\nto\n12:30\nPM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('8:55\nto\n12:45\nAM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('12:35\nto\n1:25\nPM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('1:30\nto\n2:10\nPM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('2:15\nto\n3.05\nPM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('3:10\nto\n4.00\nPM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(
                          'MON',
                          style: TextStyle(
                              overflow: TextOverflow.visible,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              letterSpacing: .1,
                              color: Colors.red),
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('8:55\nto\n9:45\nAM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('9:50\nto\n10:40\nAM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('10:45\nto\n11:35\nAM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('11:40\nto\n12:30\nPM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('8:55\nto\n12:45\nAM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('12:35\nto\n1:25\nPM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('1:30\nto\n2:10\nPM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('2:15\nto\n3.05\nPM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('3:10\nto\n4.00\nPM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(
                          'TUE',
                          style: TextStyle(
                              overflow: TextOverflow.visible,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              letterSpacing: .1,
                              color: Colors.red),
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('8:55\nto\n9:45\nAM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('9:50\nto\n10:40\nAM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('10:45\nto\n11:35\nAM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('11:40\nto\n12:30\nPM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('8:55\nto\n12:45\nAM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('12:35\nto\n1:25\nPM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('1:30\nto\n2:10\nPM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('2:15\nto\n3.05\nPM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('3:10\nto\n4.00\nPM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(
                          'WED',
                          style: TextStyle(
                              overflow: TextOverflow.visible,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              letterSpacing: .1,
                              color: Colors.red),
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('8:55\nto\n9:45\nAM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('9:50\nto\n10:40\nAM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('10:45\nto\n11:35\nAM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('11:40\nto\n12:30\nPM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('8:55\nto\n12:45\nAM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('12:35\nto\n1:25\nPM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('1:30\nto\n2:10\nPM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('2:15\nto\n3.05\nPM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('3:10\nto\n4.00\nPM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(
                          'THU',
                          style: TextStyle(
                              overflow: TextOverflow.visible,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              letterSpacing: .1,
                              color: Colors.red),
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('8:55\nto\n9:45\nAM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('9:50\nto\n10:40\nAM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('10:45\nto\n11:35\nAM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('11:40\nto\n12:30\nPM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('8:55\nto\n12:45\nAM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('12:35\nto\n1:25\nPM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('1:30\nto\n2:10\nPM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('2:15\nto\n3.05\nPM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('3:10\nto\n4.00\nPM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(
                          'FRI',
                          style: TextStyle(
                              overflow: TextOverflow.visible,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              letterSpacing: .1,
                              color: Colors.red),
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('8:55\nto\n9:45\nAM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('9:50\nto\n10:40\nAM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('10:45\nto\n11:35\nAM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('11:40\nto\n12:30\nPM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('8:55\nto\n12:45\nAM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('12:35\nto\n1:25\nPM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('1:30\nto\n2:10\nPM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('2:15\nto\n3.05\nPM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('3:10\nto\n4.00\nPM',
                            style: TextStyle(
                                overflow: TextOverflow.visible,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: .1,
                                color: Colors.blue)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

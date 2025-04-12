import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
  final TextEditingController _noteController = TextEditingController();
  late List<String> list = [];

  /// appp build

  @override
  void initState() {
    super.initState();
    loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Notes'),
        backgroundColor: Colors.yellow,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: _noteController,
              decoration: const InputDecoration(
                  hintText: 'Write Something...', border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: addInformationToList,
                child: const Text('Add'),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            dataUi(),
          ],
        ),
      ),
    );
  }

  Widget dataUi() {
    return Expanded(
      child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(list[index].toString()),
              trailing: GestureDetector(
                  onTap: () {
                    list.removeAt(index);

                    ///
                    saveNotes();
                    setState(() {});
                  },
                  child: Icon(Icons.delete)),
            );
          }),
    );
  }

  addInformationToList() {
    list.add(_noteController.text); //  2

    saveNotes();
    setState(() {});
  }

  Future<void> saveNotes() async {
    SharedPreferences ob = await SharedPreferences.getInstance();
    await ob.setStringList('notes', list);
  }

  Future<void> loadNotes() async {
    SharedPreferences ob = await SharedPreferences.getInstance();

    List<String>? storedNotes = ob.getStringList('notes');
    list = storedNotes!;
    setState(() {});
  }
}

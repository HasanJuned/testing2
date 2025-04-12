import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes App',
      home: NotesHomePage(),
    );
  }
}

class NotesHomePage extends StatefulWidget {
  const NotesHomePage({super.key});

  @override
  _NotesHomePageState createState() => _NotesHomePageState();
}

class _NotesHomePageState extends State<NotesHomePage> {

  List<String> notes = [];
  TextEditingController noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadNotes();
  }

  Future<void> loadNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? storedNotes = prefs.getStringList('notes');
    if (storedNotes != null) {
      setState(() {
        notes = storedNotes;
      });
    }
  }

  Future<void> saveNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('notes', notes);
  }

  void addNote() {
    String text = noteController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        notes.add(text);
        noteController.clear();
      });
      saveNotes();
    }
  }

  void deleteNote(int index) {
    setState(() {
      notes.removeAt(index);
    });
    saveNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notes')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: noteController,
                    decoration: const InputDecoration(
                      hintText: 'Enter a note',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: addNote,
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) =>
                  Card(
                    child: ListTile(
                      title: Text(notes[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => deleteNote(index),
                      ),
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

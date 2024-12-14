import 'package:flutter/material.dart';
import 'package:flutter_ass4/model/notes.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Note"),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
                hintText: 'Enter title',
                contentPadding: const EdgeInsets.all(10),
                prefixIcon: const Icon(Icons.title),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    titleController.clear();
                  },
                ),
              ),
            ),
            
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Note',
                border: OutlineInputBorder(),
                hintText: 'Enter your Note',
                contentPadding: const EdgeInsets.all(10),
                prefixIcon: const Icon(Icons.description),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    descriptionController.clear();
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newNote = Note(
                  title: titleController.text,
                  note: descriptionController.text,
                  date: DateTime.now(),
                );

                
                Navigator.pop(context, newNote);
              },
              child: const Text('Save Note'),
            ),
          ],
        ),
      ),
    );
  }
}

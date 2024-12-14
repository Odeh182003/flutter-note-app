import 'package:flutter/material.dart';
import 'package:flutter_ass4/pages/details.dart';
import 'package:flutter_ass4/pages/notes.dart';
import 'package:flutter_ass4/controller/notes.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final NoteController _controller = NoteController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
       // padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Show an image and text when no notes are available
            if (_controller.notes.isEmpty)
              Column(
                children: [
                  Image.asset("assets/images/image.png", height: 100),
                  const Text("No Notes yet", style: TextStyle(color: Colors.white)),
                ],
              ),
            
            const Text(
              'Saved Notes:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _controller.notes.length,
                itemBuilder: (context, index) {
                  final note = _controller.notes[index];

                  // Print note data to debug
                  print('Displaying note: Title - ${note.title}, Note - ${note.note}');

                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      title: Text(note.title),  // Display the title
                      subtitle: Text(note.note),  // Display the note content
                      trailing: Text(
                        '${note.date.day}/${note.date.month}/${note.date.year}',  // Show the date
                        style: const TextStyle(fontSize: 12, color: Colors.black),
                      ),
                      onTap:(){
                      // Navigate to the note detail page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>DetailsNotes(note: note,)),
                      );
                    }
                    ),
                    
                    
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 53, 52, 121),
        onPressed: () async {
          // Navigate to Notes page to add a new note
          final newNote = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Notes()),
          );

          // After adding a note, check if a note was returned
          if (newNote != null) {
            // Add the new note to the controller
            _controller.addNote(newNote);

            // Print to verify note was added to the controller
            print('New note added: Title - ${newNote.title}, Note - ${newNote.note}');

            // Trigger UI update
            setState(() {});
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

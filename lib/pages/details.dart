import 'package:flutter/material.dart';
import 'package:flutter_ass4/model/notes.dart';

class DetailsNotes extends StatelessWidget{
   final Note note;
   const DetailsNotes({Key? key, required this.note}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(note.title),
        titleTextStyle: TextStyle(color: Colors.white),
         backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.blueGrey,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
                  child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            const SizedBox(height: 10),
            Text(
              'Date: ${note.date.day}/${note.date.month}/${note.date.year}',
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(height: 20),
            Text(
              note.note,
              style: const TextStyle(fontSize: 26, color: Colors.white),
            ),
          ],
        ),

          ),
          );
          }

}
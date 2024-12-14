import 'package:flutter/material.dart';
import 'package:flutter_ass4/model/notes.dart';

class NoteController {
  List<Note> notes = [];
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  // Method to add a new note and return it
  Note addNote(Note newNote) {
    // Add the note to the list of notes
    notes.add(newNote);

    // Clear the input fields
    titleController.clear();
    descriptionController.clear();

    return newNote;
  }
}

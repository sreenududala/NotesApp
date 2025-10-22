import 'package:flutter/material.dart';
import 'package:notesapp/note_edit_screen.dart';

class NoteViewScreen extends StatelessWidget {
  final Map<String, String> note;
  final int index;

  const NoteViewScreen({super.key, required this.note, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(note['title'] ?? 'Note'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () async {
              final updatedNote = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => NoteEditScreen(note: note),
                ),
              );
              if (updatedNote != null) {
                Navigator.pop(context, updatedNote);
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          note['desc'] ?? '',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

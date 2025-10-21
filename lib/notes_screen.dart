import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notesapp/addnotes_screen.dart';





class NotesHome extends StatefulWidget {
  const NotesHome({super.key});

  @override
  State<NotesHome> createState() => _NotesHomeState();
}

class _NotesHomeState extends State<NotesHome> {
  List<Map<String, String>> notes =[

  ];

  void openAddNotePage() async {
    final newNote = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) =>  AddNoteScreen()),
    );

    if (newNote != null) {
      setState(() {
        notes.add({
          'title': newNote['title'],
          'desc': newNote['desc'],
        });
      });
    }
  }
  void deleteNote(int index) {
    setState(() {
      notes.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Note deleted")),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title:  Text("Notes Home"),

        actions: [
          IconButton(
            icon:  Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding:  EdgeInsets.all(20),
            child: Column(
              children: [
                 Text(
                  "Your Notes",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

              ],
            ),
          ),
          Expanded(
            child: notes.isEmpty
                ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(
                    "No notes yet",
                    style: TextStyle(fontSize: 18),
                  ),
                   SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: openAddNotePage,
                    child:  Text("Add a note"),
                  ),
                ],
              ),
            )
                : ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];
                return Card(
                  elevation: 5,
                  margin:  EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(
                      note['title']!,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(note['desc']!),
    trailing: IconButton(
    icon:  Icon(Icons.delete, color: Colors.red),
    onPressed: () {
    showDialog(
    context: context,
    builder: (context) => AlertDialog(
    title:  Text("Delete Note"),
    content:  Text(
    "Are you sure you want to delete this note?"),
    actions: [
    TextButton(
    onPressed: () =>
    Navigator.pop(context),
    child:  Text("Cancel"),
    ),
    TextButton(
    onPressed: () {
    deleteNote(index);
    Navigator.pop(context);
    },
    child:  Text(
    "Delete",
      style: TextStyle(color: Colors.red),
    ),
    ),
    ],
    ),
    );
    },
    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openAddNotePage,
        child: const Icon(Icons.add),
      ),
    );
  }
}
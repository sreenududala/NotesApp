import 'package:flutter/material.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFF7F7FF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title:  Text(
          "Add Notes",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon:  Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
      IconButton(
      icon: const Icon(Icons.check, color: Colors.black),
      onPressed: () {
        if (_titleController.text.isNotEmpty || _descriptionController.text.isNotEmpty) {
          Navigator.pop(context, {
            'title': _titleController.text,
            'desc': _descriptionController.text,
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(content: Text('Please enter title or description')),
          );
        }
      },

          )
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              "Title",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
             SizedBox(height: 8),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: "Enter note title",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
             SizedBox(height: 20),

             Text(
              "Description",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
             SizedBox(height: 8),
            Expanded(
              child: TextField(
                controller: _descriptionController,
                keyboardType: TextInputType.multiline,
                textAlignVertical:TextAlignVertical.top,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  hintText: "Write your note here...",
                  alignLabelWithHint: true,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),


    );
  }
}
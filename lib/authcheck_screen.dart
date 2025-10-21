import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notesapp/notes_screen.dart';
import 'login_screen.dart';

class Authcheck extends StatelessWidget {
  const Authcheck({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const NotesHome();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
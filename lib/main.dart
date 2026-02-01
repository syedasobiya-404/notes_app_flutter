import 'package:flutter/material.dart';
import 'package:notes_app/providers/notes_provider.dart';
import 'package:notes_app/screens/show_notes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotesProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Notes App",
        theme: ThemeData.dark(),
        home: ShowNotes(),
      ),
    );
  }
}

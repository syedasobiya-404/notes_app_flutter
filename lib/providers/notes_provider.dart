import 'package:flutter/material.dart';

class NotesProvider extends ChangeNotifier {
  List<Map> notes = [];

  void addNote(Map item) {
    notes.add(item);
    notifyListeners();
  }

  void removeNote(Map item) {
    notes.remove(item);
    notifyListeners();
  }

  void updateNote(Map item, int index) {
    notes[index] = item;
    notifyListeners();
  }
}

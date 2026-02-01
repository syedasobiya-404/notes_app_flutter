import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  final String title;
  final String description;
  const NoteCard({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(
        3.5,
      ),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFFCE93D8),
        borderRadius: BorderRadius.circular(
          6,
        ),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            description,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

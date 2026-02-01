import 'package:flutter/material.dart';
import 'package:notes_app/providers/notes_provider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});
  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create A Note",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              style: TextStyle(
                fontSize: 20,
              ),
              decoration: InputDecoration(
                hintText: "Title",
                border: InputBorder.none,
                // helperText: "Title",
                // labelText: "Title",
              ),
              autofocus: true,
              maxLength: 120,
              minLines: 1,
              maxLines: 2,
            ),
            TextField(
              controller: descriptionController,
              style: TextStyle(
                fontSize: 20,
              ),
              decoration: InputDecoration(
                hintText: "Description",
                border: InputBorder.none,
                // helperText: "Title",
                // labelText: "Title",
              ),
              autofocus: true,
              minLines: 1,
              maxLines: 24,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // print(titleController.text);
          // print(descriptionController.text);
          // print({
          //   "_id": Uuid().v6(),
          //   "title": titleController.text,
          //   "description": descriptionController.text,
          //   "created_at": DateTime.now().toString()
          // });
          if (titleController.text.trim().isNotEmpty ||
              descriptionController.text.trim().isNotEmpty) {
            Provider.of<NotesProvider>(context, listen: false).addNote({
              "_id": Uuid().v6(),
              "title": titleController.text.trim(),
              "description": descriptionController.text.trim(),
              "created_at": DateTime.now().toString()
            });

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Note Created Successfully",
                ),
              ),
            );

            Navigator.pop(context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Empty Note Discarded",
                ),
              ),
            );
            Navigator.pop(context);
          }
        },
        child: Icon(
          Icons.check,
        ),
      ),
    );
  }
}

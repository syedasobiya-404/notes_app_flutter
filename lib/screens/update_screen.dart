import 'package:flutter/material.dart';
import 'package:notes_app/providers/notes_provider.dart';
import 'package:provider/provider.dart';

class UpdateScreen extends StatefulWidget {
  final Map item;
  final int index;
  const UpdateScreen({super.key, required this.item, required this.index});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController discriptionController = TextEditingController();

  @override
  void initState() {
    titleController.text = widget.item["title"];
    discriptionController.text = widget.item["description"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Update Note",
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Are Your Sure ?"),
                    content: Text("This action will delete this note"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                          "No",
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Provider.of<NotesProvider>(context, listen: false)
                              .removeNote(widget.item);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Note Deleted Successfully",
                              ),
                            ),
                          );
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Text(
                          style: TextStyle(
                            color: Colors.red,
                          ),
                          "Yes",
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(
              color: Colors.red,
              Icons.delete,
            ),
          ),
        ],
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
              controller: discriptionController,
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
          if (titleController.text.trim().isNotEmpty ||
              discriptionController.text.trim().isNotEmpty) {
            Provider.of<NotesProvider>(context, listen: false).updateNote(
              {
                "title": titleController.text,
                "description": discriptionController.text,
                "_id": widget.item["_id"],
                "created_at": widget.item["created_at"],
                "updated_at": DateTime.now().toString(),
              },
              widget.index,
            );

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Note Updated Successfully",
                ),
              ),
            );
            Navigator.pop(context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Cannot Update An Empty Note"),
              ),
            );
          }
        },
        child: Icon(
          Icons.check,
        ),
      ),
    );
  }
}

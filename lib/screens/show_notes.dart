import 'package:flutter/material.dart';
import 'package:notes_app/providers/notes_provider.dart';
import 'package:notes_app/screens/create_screen.dart';
import 'package:notes_app/screens/update_screen.dart';
import 'package:notes_app/widgets/note_card.dart';
import 'package:provider/provider.dart';

class ShowNotes extends StatefulWidget {
  const ShowNotes({super.key});

  @override
  State<ShowNotes> createState() => _ShowNotesState();
}

class _ShowNotesState extends State<ShowNotes> {
  bool isVertical = true;
  @override
  Widget build(BuildContext context) {
    List<Map> notes = Provider.of<NotesProvider>(context).notes;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notes App",
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              isVertical = !isVertical;
              setState(() {});
            },
            icon: Icon(
              Icons.line_style_rounded,
            ),
          ),
        ],
      ),
      body: notes.isNotEmpty
          ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isVertical ? 1 : 2,
                childAspectRatio: isVertical ? 3 : 1,
              ),
              itemCount: notes.length,
              itemBuilder: (context, index) {
                var item = notes[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            UpdateScreen(item: item, index: index),
                      ),
                    );
                  },
                  child: NoteCard(
                    title: item["title"],
                    description: item["description"],
                  ),
                );
              },
            )
          : Center(
              child: Text(
                "No Notes Here",
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreateScreen(),
              ));

          // Navigator.push(
          //     context,
          //     CupertinoPageRoute(
          //       builder: (context) => CreateScreen(),
          //     ));
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

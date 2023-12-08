import 'dart:ui';

import 'package:bottam/Images/images.dart';
import 'package:flutter/material.dart';


class NoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NoteList(),
    );
  }
}

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  List<String> notes = [];

  void _addNote(String note) {
    setState(() {
      notes.add(note);
    });
  }

  void deleteNote(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Note App'),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return Container(
            height: size.height/8,
            width: size.width/1.8,
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              trailing: IconButton(
                onPressed: (){
                  deleteNote(index);
                },
                icon: Icon(Icons.delete),
              ),
              title: Text(notes[index]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNote(addNote: _addNote, index: 0, note: '',)),
          );
        },
        tooltip: 'Add Note',
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddNote extends StatefulWidget {
  final Function(String) addNote;

  AddNote({required this.addNote, required int index, required String note});

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
      ),
      body: Padding(
        padding: EdgeInsets.all(4),
        child: Container(
          height: size.height,
          width: size.width,
          child: TextField(
            autocorrect: true,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            style: TextStyle(fontSize: 18),
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Note',
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.addNote(_controller.text);
          Navigator.pop(context);
        },
        tooltip: 'Save Note',
        child: Icon(Icons.save),
      ),
    );
  }
}
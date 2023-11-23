import 'package:bottam/config/testtwo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApptwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NoteProvider(),
      child: MaterialApp(
        title: 'Note App',
        initialRoute: '/',
        routes: {
          '/': (context) => NoteListScreen(),
          '/add': (context) => AddNoteScreen(),
        },
      ),
    );
  }
}
class AddNoteScreen extends StatefulWidget {
  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  late Note _editingNote;

  @override
  void initState() {
    super.initState();
    _editingNote = Note(content: '', title: '');
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    if (args != null && args.containsKey('note') && args.containsKey('edit')) {
      _editingNote = args['note'];
      _titleController.text = _editingNote.title;
      _contentController.text = _editingNote.content;
    }

    return Scaffold(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()), // Refresh the previous screen
      appBar: AppBar(
        title: Text('Add Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(labelText: 'Content'),
              maxLines: 5,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _saveNote();
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveNote() {
    final title = _titleController.text;
    final content = _contentController.text;

    if (title.isNotEmpty && content.isNotEmpty) {
      if (_editingNote.id == 0) {
        final newNote = Note(
          title: title,
          content: content,
        );
        Provider.of<NoteProvider>(context, listen: false).addNote(newNote);
      } else {
        final editedNote = Note(
          title: title,
          content: content,
          id: _editingNote.id,
        );
        Provider.of<NoteProvider>(context, listen: false).editNote(editedNote);
      }

      Navigator.pop(context);
    }
  }
}

class NoteListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<NoteProvider>(context, listen: false).fetchNotes();

    return Scaffold(
      appBar: AppBar(
        title: Text('Note App'),
      ),
      body: Consumer<NoteProvider>(
        builder: (context, noteProvider, child) {
          return ListView.builder(
            itemCount: noteProvider.notes.length,
            itemBuilder: (context, index) {
              final note = noteProvider.notes[index];
              return ListTile(
                title: Text(note.title),
                subtitle: Text(note.content),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/add',
                          arguments: {'note': note, 'edit': true},
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        noteProvider.deleteNote(note.id);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
// note.dart

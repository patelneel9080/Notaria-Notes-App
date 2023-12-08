import 'package:bottam/Images/images.dart';
import 'package:bottam/Pages/firstpage.dart';
import 'package:bottam/assistant/Icebear/icebear.dart';
import 'package:bottam/config/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Pages/assistantpage.dart';
import '../Pages/dailyquotes.dart';
import '../Tests/testone.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> notes = [];

  void _addNote(String note) {
    setState(() {
      notes.add(note);
    });
  }
  void editNote(String note){
    setState(() {
      notes.addAll(notes);
    });
  }

  void deleteNote(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }
  void _navigateToEditNote(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddNote(addNote: _addNote, index: 0, note: notes[index])
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text("NOTARIA",style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DailyQuotes(),
                    ));
              },
              icon: const Icon(CupertinoIcons.smiley))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNote(addNote: _addNote, index: 0, note: '',)),
          );
        },
        tooltip: 'Add Note',
        child: const Icon(Icons.add),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.deepPurpleAccent,
                ),
                child: Text(
                  UserId,
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                )),
            ListTile(
              leading: const Icon(Icons.assistant),
              title: const Text("Assistant",style: TextStyle(color:Color(0xff898989),fontWeight: FontWeight.w600),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AssistantPage(),));
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text("Log Out",style: TextStyle(color:Color(0xff898989),fontWeight: FontWeight.w600),),
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const FirstPage(),));
                });
              },
            )
          ],
        ),
      ),
      body: Container(height: size.height,width: size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AssistantPage(),
                      ));
                },
                child: Container(
                  height: size.height / 8,
                  width: size.width / 1.1,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(BackgroundImg2.three),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Your Assistants",
                            style: GoogleFonts.aboreto(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height,
                width: size.width/1.8,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const ScrollPhysics(),
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        _navigateToEditNote(index);
                      },
                      child: Flexible(
                        fit: FlexFit.tight,
                        child: Container(
                          height: size.height/9,
                          width: size.width/1.8,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            image: const DecorationImage(image: NetworkImage(PageImg.notebkg),fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            trailing: IconButton(
                              onPressed: (){
                                deleteNote(index);
                              },
                              icon: const Icon(Icons.delete),
                            ),
                            title: Text(notes[index]),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
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
class NoteTaker extends StatefulWidget {
  @override
  _NoteTakerState createState() => _NoteTakerState();

  static of(BuildContext context) {}
}

class _NoteTakerState extends State<NoteTaker> {
  List<String> notes = [];
  TextEditingController inputController = TextEditingController();

  void _addNote() {
    setState(() {
      notes.add(inputController.text);
      inputController.clear();
    });
  }
  void _editNote(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NoteEditPage(
          note: notes[index],
          onSave: (text) => saveNote(index, text),
        ),
      ),
    );
  }
  void saveNote(int index, String text) {
    setState(() {
      notes[index] = text;
    });
  }

  void _navigateToEditNote(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditNote(
          note: notes[index],
          noteIndex: index,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note Taker'),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(notes[index]),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => _navigateToEditNote(index),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNote,
        tooltip: 'Add Note',
        child: const Icon(Icons.add),
      ),
    );
  }
}


class _AddNoteState extends State<AddNote> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _titlecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autocorrect: true,
          keyboardType: TextInputType.multiline,
          maxLines: 1,
          style: const TextStyle(fontSize: 22),
          controller: _titlecontroller,
          decoration: const InputDecoration(
            labelText: 'Title',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4),
        child: Container(
          height: size.height,
          width: size.width,
          child: TextField(
            autocorrect: true,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            style: const TextStyle(fontSize: 18),
            controller: _controller,
            decoration: const InputDecoration(
              labelText: 'Note',
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // widget.addNote(_titlecontroller.text);
          widget.addNote(_controller.text);
          Navigator.pop(context);
        },
        tooltip: 'Save Note',
        child: const Icon(Icons.save),
      ),
    );
  }
}

class EditNote extends StatefulWidget {
  final String note;
  final int noteIndex;

  EditNote({required this.note, required this.noteIndex});

  @override
  _EditNoteState createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  late TextEditingController _inputController;

  @override
  void initState() {
    super.initState();
    _inputController = TextEditingController(text: widget.note);
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  void _updateNote() {
    setState(() {
      NoteTaker.of(context).notes[widget.noteIndex] = _inputController.text;
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check,color: Colors.black,),
            onPressed: _updateNote,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _inputController,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          autofocus: true,
        ),
      ),
    );
  }
}

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
import '../theme/app_theme.dart';

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

  void editNote(String note) {
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
    print("Neel:${notes[index]}");
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AddNote(
                addNote: _addNote,
                index: 0,
                note: notes[index],
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        centerTitle: true,

        backgroundColor: Colors.deepPurpleAccent,
        title: const Text(
          "NOTARIA",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          // IconButton(
          //     onPressed: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => DailyQuotes(),
          //           ));
          //     },
          //     icon: const Icon(CupertinoIcons.smiley))
          GestureDetector(
            onTap: () {
              setState(() {
                isLight = !isLight;
                print(isLight);
              });
            },
            child: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DailyQuotes(),));
              },
              icon: Icon(CupertinoIcons.quote_bubble_fill
              ,color: Colors.amber,)
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNote(
                addNote: _addNote,
                index: 0,
                note: '',
              ),
            ),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      " Hi $UserId",
                      style: const TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    Image.network(WelcomeBkg.bitemoji)
                  ],
                ),),
            ListTile(
              leading: const Icon(Icons.assistant),
              title: const Text(
                "Assistant",
                style: TextStyle(
                    color: Color(0xff898989), fontWeight: FontWeight.w600),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AssistantPage(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text(
                "Log Out",
                style: TextStyle(
                    color: Color(0xff898989), fontWeight: FontWeight.w600),
              ),
              onTap: () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FirstPage(),
                      ));
                });
              },
            )
          ],
        ),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: size.height / 44,
              ),
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
                height: size.height / 54,
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: size.width/17,),
                  Text("Your Notes :",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                ],
              ),
              SizedBox(
                height: size.height / 74,
              ),
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return Flexible(
                    child: Container(
                      margin:
                          const EdgeInsets.only(left: 14, right: 14, top: 10),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        image: const DecorationImage(
                            image: NetworkImage(PageImg.notebkg),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        trailing: IconButton(
                          onPressed: () {
                            deleteNote(index);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                        title: Text(notes[index]),
                      ),
                    ),
                  );
                },
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

  AddNote({
    required this.addNote,
    required int index,
    required String note,
  });

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
        builder: (context) => NoteEditPage(
          note: notes[index],
          onSave: (text) => saveNote(index, text),
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
          return ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NoteEditPage(
                            note: notes[index],
                            onSave: (String) {},
                          )));
            },
            title: Text(notes[index]),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                print(notes[index]);
              },
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(

      appBar: AppBar(
        title: Text("Add Note",style: TextStyle(color: Colors.white),),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4),
        child: Container(
          height: size.height,
          width: size.width,
          child: TextField(
            autocorrect: true,
            cursorColor: Colors.white,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            style: const TextStyle(color: Colors.white,fontSize: 18),
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

class NoteEditPage extends StatefulWidget {
  final String note;
  final Function(String) onSave;

  NoteEditPage({
    required this.note,
    required this.onSave,
  });

  @override
  _NoteEditPageState createState() => _NoteEditPageState();
}

class _NoteEditPageState extends State<NoteEditPage> {
  TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textController.text = widget.note;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text('Edit Note'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.save,
              color: Colors.black,
            ),
            onPressed: () {
              widget.onSave(_textController.text);
              Navigator.pop(context);
              print(widget.onSave(_textController.text));
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: TextField(
          controller: _textController,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        ),
      ),
    );
  }
}

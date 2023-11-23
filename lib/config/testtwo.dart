import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Note {
  int id;
  String title;
  String content;

  Note({
    required this.title,
    required this.content,
    this.id = 0,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'content': content};
  }
}

class NoteProvider extends ChangeNotifier {
  List<Note> _notes = [];

  List<Note> get notes => _notes;

  Future<void> addNote(Note note) async {
    await DatabaseHelper.instance.insert(note);
    _notes = await DatabaseHelper.instance.queryAllNotes();
    notifyListeners();
  }

  Future<void> fetchNotes() async {
    _notes = await DatabaseHelper.instance.queryAllNotes();
    notifyListeners();
  }

  Future<void> deleteNote(int id) async {
    await DatabaseHelper.instance.delete(id);
    _notes = await DatabaseHelper.instance.queryAllNotes();
    notifyListeners();
  }

  Future<void> editNote(Note note) async {
    await DatabaseHelper.instance.update(note);
    _notes = await DatabaseHelper.instance.queryAllNotes();
    notifyListeners();
  }
}

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'notes_database.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE notes(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        content TEXT
      )
    ''');
  }

  Future<int> insert(Note note) async {
    final db = await database;
    return await db.insert('notes', note.toMap());
  }

  Future<List<Note>> queryAllNotes() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('notes');
    return List.generate(maps.length, (i) {
      return Note(
        id: maps[i]['id'],
        title: maps[i]['title'],
        content: maps[i]['content'],
      );
    });
  }

  Future<int> delete(int id) async {
    final db = await database;
    return await db.delete('notes', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(Note note) async {
    final db = await database;
    return await db.update('notes', note.toMap(), where: 'id = ?', whereArgs: [note.id]);
  }
}

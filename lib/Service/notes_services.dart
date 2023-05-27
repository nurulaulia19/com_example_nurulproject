import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:com_example_nurulproject/Model/note.dart';

class NotesServices {
  static CollectionReference _notesCollection =
      FirebaseFirestore.instance.collection('notes');
  static Future<void> updateNotes(Note note) async {
    await _notesCollection.doc(note.id).set({
      // 'userId': note.id,
      'title': note.title,
      'content': note.content,
      'time': DateTime.now()
    });
  }

  static Future<List<Note>> getNotes() async {
    QuerySnapshot snapshot =
        await _notesCollection.orderBy('time', descending: true).get();
    var documents = snapshot.docs;
    List<Note> notes = [];
    for (var document in documents) {
      notes.add(Note(
          id: document.id,
          title: (document.data() as dynamic)['title'],
          content: (document.data() as dynamic)['content'],
          time: (document.data() as dynamic)['time'].toString()));
    }
    return notes;
  }

  static Future<void> deleteNote(String id) async {
    await _notesCollection.doc(id).delete();
  }
}

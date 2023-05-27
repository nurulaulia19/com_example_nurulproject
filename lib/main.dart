import 'package:com_example_nurulproject/Pages/list_notes_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: ListNotesPage(),
    );
  }
}

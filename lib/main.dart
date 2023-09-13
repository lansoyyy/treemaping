import 'package:communal/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          authDomain: 'treemaping-45201.firebaseapp.com',
          apiKey: "AIzaSyBpPh8yBpqzVkt6Q0JNPtjWrR-osV7TdE4",
          appId: "1:988715309097:web:69a45d17f9f162718d6438",
          messagingSenderId: "988715309097",
          projectId: "treemaping-45201",
          storageBucket: "treemaping-45201.appspot.com"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'TREEMAPING',
      home: HomeScreen(),
    );
  }
}

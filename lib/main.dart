import 'package:firebase_app/screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAWgk27pTgKLxexYodtXfvMfSPCHudm1QA",
      authDomain: "student-management-f5394.firebaseapp.com",
      projectId: "student-management-f5394",
      storageBucket: "student-management-f5394.appspot.com",
      messagingSenderId: "939831159853",
      appId: "1:939831159853:web:a26c067c1487a2ae8b1ca4")
    );
  }else{
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenHome(),
    );
  }
}
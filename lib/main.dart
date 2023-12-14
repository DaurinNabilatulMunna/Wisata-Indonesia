import 'package:flutter/material.dart';
import 'package:project_mobile/models/login.dart';
import 'package:firebase_core/firebase_core.dart';

late FirebaseApp app;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBYx6jWwZebfhjIZoqMMVV338m1wSi9n2w",
          appId: "1:142650391354:android:4de0d16476993721846e03",
          messagingSenderId: "142650391354",
          projectId: "project-mobile-d2f13"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'REST API',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: Home2(),
      home : login(),
    );
  }
}

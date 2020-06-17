import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './screens/auth_screen.dart';
import './screens/players_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StreamBuilder(stream: FirebaseAuth.instance.onAuthStateChanged, builder: (context, snapshot) {
        return snapshot.hasData ? PlayersScreen() : AuthScreen();
      },),
    );
  }
}

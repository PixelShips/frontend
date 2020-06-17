import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/auth_form.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  bool _isLoading = false;

  void _authFormData(String userName, String email, String password,
      bool isLogin, BuildContext ctx) async {
    AuthResult authResult;
    final sharedEmail = await SharedPreferences.getInstance();
    sharedEmail.setString('email', email);
    try {
      setState(() {
        _isLoading = true;
      });
      if (isLogin) {
        authResult = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        authResult = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await Firestore.instance.collection('Users').document(email).setData({
          'username': userName,
          'email': email,
          'active': true,
          'videoCall': true,
          'voiceCall': true,
        });
      }
    } on PlatformException catch (error) {
      var errorMessage = 'Wystąpił błąd poczas logowania';
      if (error.message != null) {
        errorMessage = error.message;
      }

      Scaffold.of(ctx).showSnackBar(SnackBar(
        content: Text(errorMessage),
      ));
      setState(() {
        _isLoading = false;
      });
    } catch (error) {
      print(error);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logowanie'),
      ),
      body: Center(
        child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    colors: [Colors.lime[200], Colors.teal[300]])),
            child: AuthForm(_authFormData, _isLoading)),
      ),
    );
  }
}

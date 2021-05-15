import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseAuth = Provider.of<FirebaseAuth>(context);

    return MaterialApp(
      home: Center(
        child: Container(
          child: TextButton(
            child: Text('Sign In'),
            onPressed: () {
              firebaseAuth.signInWithEmailAndPassword(
                email: 'ishan@ishan.com',
                password: '1234567',
              );
            },
          ),
        ),
      ),
    );
  }
}

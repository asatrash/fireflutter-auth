import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseAuth = Provider.of<FirebaseAuth>(context);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home View'),
          actions: [
            TextButton(
              child: Text('Sign Out'),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
                firebaseAuth.signOut();
              },
            ),
          ],
        ),
        body: Center(
          child: Container(child: Text('Home View content')),
        ),
      ),
    );
  }
}

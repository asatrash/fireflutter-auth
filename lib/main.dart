//Ref: http://bizz84.github.io/2019/06/10/global-access-vs-scoped-access.html

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:fireauth_starter/views/home_view.dart';
import 'views/login_page_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FireAuthStarter());
}

class FireAuthStarter extends StatelessWidget {
  //final Future<FirebaseApp> _initialisation = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    //

    return Provider<FirebaseAuth>(
      create: (context) => FirebaseAuth.instance,
      child: MaterialApp(
        title: 'Firebase Authentication',
        home: LandingPage(),
      ),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage();

  @override
  Widget build(BuildContext context) {
    final firebaseAuth = Provider.of<FirebaseAuth>(context);
    return StreamBuilder<User>(
        stream: firebaseAuth.authStateChanges(),
        builder: (context, AsyncSnapshot<User> snapshot) {
          print(snapshot.connectionState.toString());
          if (snapshot.connectionState == ConnectionState.active) {
            //final bool signedIn = snapshot.hasData;
            User user = snapshot.data;
            return user == null ? LoginPageView() : HomeView();
            //return signedIn ? DashBoard() : FirstView();
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}

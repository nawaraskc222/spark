import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:spark/login_state.dart';
import '../constants.dart';
import '../src/authentication.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<LoginState>(
              builder: (context, appState, _) => AuthFunc(
                  loggedIn: appState.loggedIn,
                  signOut: () {
                    FirebaseAuth.instance.signOut();
                  }),
            ),
            OutlinedButton(
              onPressed: () {
                context.goNamed(signInRouteName);
              },
              child: Text('Sign In'),
            ),
            OutlinedButton(
              onPressed: () {
                context.goNamed(createAccountRouteName);
              },
              child: Text('Create an Account'),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.pink,
    );
  }
}

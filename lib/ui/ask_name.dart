import 'package:flutter/material.dart';

class AskNameScreen extends StatelessWidget {
  const AskNameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(
              child: Text('Second Page'),
              onPressed: () {},
            ),
          ],
        ),
      ),
      backgroundColor: Colors.yellow,
    );
  }
}

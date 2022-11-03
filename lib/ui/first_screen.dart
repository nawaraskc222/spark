import 'package:flutter/material.dart';

import '../widgets/rounded_button.dart';

class LoggedOutScreen extends StatelessWidget {
  const LoggedOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            child: Ink(
              decoration: const ShapeDecoration(
                color: Colors.lightBlue,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_sharp),
                color: Colors.blue,
                onPressed: () {},
              ),
            ),
          ),
          Container(
            child: RoundedButton(
                colour: Colors.blueAccent, title: 'Log In', onPressed: () {}),
          ),
          Container(
            child: RoundedButton(
                colour: Colors.blueAccent,
                title: 'Create Account demo Account',
                onPressed: () {}),
          ),
        ],
      ),
    );
  }
}

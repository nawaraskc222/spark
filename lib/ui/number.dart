import 'package:flutter/material.dart';

// ignore: camel_case_types
class AskNumber extends StatefulWidget {
  const AskNumber({Key? key}) : super(key: key);

  @override
  State<AskNumber> createState() => _AskNumberState();
}

// ignore: camel_case_types
class _AskNumberState extends State<AskNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Number",
        ),
      ),
    );
  }
}

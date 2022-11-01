import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class askname extends StatefulWidget {
  const askname({Key? key}) : super(key: key);

  // const askname({super.key});

  @override
  State<askname> createState() => _asknameState();
}

class _asknameState extends State<askname> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "about ",
        ),
      ),
      backgroundColor: Colors.grey[350],
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 35, top: 130),
            child: const Text(
              "What's your name ? \n",
              style: TextStyle(
                color: Colors.black,
                fontSize: 33,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.38,
                  right: 34,
                  left: 35),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                        fillColor: Colors.amber,
                        filled: true,
                        hintText: "First Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  // const Padding(padding: EdgeInsets.all(10)),

                  const SizedBox(
                    height: 30,
                  ),

                  TextField(
                    // obscureText: true, thi used for password
                    decoration: InputDecoration(
                        fillColor: Colors.amber,
                        filled: true,
                        hintText: "Last Name ",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 35, top: 445),
            child: const Text(
              "By tapping Sign Up and Accept,you acknowledgee that\nyou have read the Privacy Policy and agree to the Terms \nof Services.",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          Container(
            // padding: const EdgeInsets.only(left: 140, top: 500, right: 45),
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.70,
                right: 34,
                left: 130),
            child: TextButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const Register()),
                // );
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 171, 169, 161),
                // onSurface: Colors.amber,
              ),
              child: const Text(
                "Next",
              ),
            ),
          ),
          // Row(
          //   children: const [
          //     TextButton(
          //       onPressed: null,
          //       child: Text("sign in"),
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}

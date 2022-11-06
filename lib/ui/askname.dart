import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants.dart';

// ignore: camel_case_types
class askname extends StatefulWidget {
  const askname({Key? key}) : super(key: key);

  // const askname({super.key});

  @override
  State<askname> createState() => _asknameState();
}

class _asknameState extends State<askname> {
  TextEditingController fname = TextEditingController();

  TextEditingController lname = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    fname.dispose();
    lname.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "about ",
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            context.goNamed(createAccountRouteName);
          },
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
                    controller: fname,
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
                    controller: lname,
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
              onPressed: () async {
                // DatabaseReference ref = FirebaseDatabase.instance.ref("users");

                // await ref.set({
                //   "name": "John",
                //   "age": 18,
                // });
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
        ],
      ),
    );
  }
}

//   // void createUser({required String name}) {}
//   // Future _create() async {
//   //   final user = FirebaseAuth.instance.currentUser;

//   //   if (user != null) {
//   //     try {
//   //       final userCollection =
//   //           FirebaseFirestore.instance.collection("usersname");

//   //       final docRef = userCollection.doc("u-id");
//   //       await docRef.set({"fname": fname.text, "lname": lname.text});
//   //     } catch (e) {
//   //       print("rooroe");
//   //     }

//   //     context.goNamed(askNumberRouteName);
//   //   }

//   // FirebaseFirestore.instance.collection('users').add(<String, dynamic>{
//   //   'name': fname.text,
//   //   'userId': lname.text,
//   // });
// }
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class askname extends StatelessWidget {
//   // final String fullName;
//   // final String company;
//   // final int age;

//   // askname(this.fullName, this.company, this.age);

//   @override
//   Widget build(BuildContext context) {
//     // Create a CollectionReference called users that references the firestore collection
//     CollectionReference users = FirebaseFirestore.instance.collection('users');

//     Future<void> addUser() {
//       // Call the user's CollectionReference to add a new user
//       return users
//           .add({
//             'full_name': "fullName", // John Doe
//             'company': "company", // Stokes and Sons
//             'age': 42 // 42
//           })
//           .then((value) => print("User Added"))
//           .catchError((error) => print("Failed to add user: $error"));
//     }

//     return TextButton(
//       onPressed: addUser,
//       child: const Text(
//         "Add User",
//       ),
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';

// class askname extends StatelessWidget {
//   late final String documentId;

//   @override
//   Widget build(BuildContext context) {
//     CollectionReference users = FirebaseFirestore.instance.collection('users');

//     return FutureBuilder<DocumentSnapshot>(
//       future: users.doc(documentId).get(),
//       builder:
//           (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Text("Something went wrong");
//         }

//         if (snapshot.hasData && !snapshot.data!.exists) {
//           return Text("Document does not exist");
//         }

//         if (snapshot.connectionState == ConnectionState.done) {
//           Map<String, dynamic> data =
//               snapshot.data!.data() as Map<String, dynamic>;
//           return Text(
//               "Full Name: ${data['full_name']} ${data['age']} ${data['company']}");
//         }

//         return Text("loading");
//       },
//     );
//   }
// }

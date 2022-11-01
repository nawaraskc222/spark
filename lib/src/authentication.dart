import 'package:flutter/material.dart';
import 'package:spark/constants.dart';
import 'package:spark/ui/signin_screen.dart';
import 'package:go_router/go_router.dart';
import '../widgets/rounded_button.dart';
import '../widgets/widgets.dart';

enum ApplicationLoginState {
  loggedOut,
  emailAddress, //verifyemail
  register,
  password, //signinwithEmailAndPassword
  loggedIn,
}

/////first page of Application.....

class Authentication extends StatelessWidget {
  const Authentication({
    required this.email,
    required this.loginState,
    //required this.startLoginFlow,
    required this.verfiyEmail,
    required this.signInWithEmailAndPassword,
    required this.cancelRegistration,
    required this.registerAccount,
    required this.signOut,
  });

  final String? email;
  final ApplicationLoginState loginState;
  //final void Function() startLoginFlow;
  final void Function(
    String email,
    void Function(Exception e) error,
  ) verfiyEmail;

  final void Function(String email, String password,
      void Function(Exception e) errorCallback) signInWithEmailAndPassword;

  final void Function() cancelRegistration;
  final void Function(
    String email,
    String password,
    void Function(Exception e) error,
  ) registerAccount;
  final void Function() signOut;

  @override
  Widget build(BuildContext context) {
    switch (loginState) {
      case ApplicationLoginState.loggedOut:
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.all(10.0),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: RoundedButton(
                      colour: Colors.blueAccent,
                      title: 'Log In',
                      onPressed: () {
                        context.goNamed(signInRouteName);
                      }),
                ),

                /////first page of Application.....
                Container(
                  child: RoundedButton(
                      colour: Colors.blueAccent,
                      title: 'Create Account demo',
                      onPressed: () {
                        context.goNamed(createAccountRouteName);
                      }),
                ),
              ],
            ),
          ),
        );

      // case ApplicationLoginState.loggedOut:
      //   return SignInScreen();
      //  EmailForm(
      //     callback: (email) => verifyEmail(
      //         email, (e) => _showErrorDialog(context, 'Invalid email', e)));
      // case ApplicationLoginState.password:
      //   return PasswordForm(
      //     email: email!,
      //     login: (email, password) {
      //       signInWithEmailAndPassword(email, password,
      //           (e) => _showErrorDialog(context, 'Failed to sign in', e));
      //     },
      //   );
      // case ApplicationLoginState.register:
      //   return RegisterForm(
      //     email = email!,
      //     cancel: () {
      //       cancelRegistration();
      //     },
      //     registerAccount: (
      //       email,
      //       displayName,
      //       password,
      //     ) {
      //       registerAccount(email, displayName, password,
      //           (e) => _showErrorDialog(context, 'Failed to sign in', e));
      //     },
      //   );
      case ApplicationLoginState.loggedIn:
        return SafeArea(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24, bottom: 8),
                child: StyledButton(
                  onPressed: () {
                    signOut();
                  },
                  child: const Text('LOGOUT'),
                ),
              )
            ],
          ),
        );
      default:
        return SafeArea(
          child: Container(
            color: Colors.green,
            child: const Text(
              'Internal Error',
              textScaleFactor: 1,
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
    }
  }
}

// void _showErrorDialog(BuildContext context, String title, Exception e) {
//   showDialog<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(
//             title,
//             style: TextStyle(fontSize: 24),
//           ),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: <Widget>[
//                 Text(
//                   '${(e as dynamic).message}',
//                   style: TextStyle(fontSize: 18),
//                 ),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             StyledButton(
//               child: Text('OK', style: TextStyle(color: Colors.deepPurple)),
//               onPressed: () {
//                 //
//               },
//             ),
//           ],
//         );
//       });
// }

// class Emailform extends StatefulWidget {
//   Emailform({required this.callback});
//   final void Function(String email) callback;
//   @override
//   _EmailFormState createState() => _EmailFormState();
// }

// class _EmailFormState extends State<Emailform> {
//   final _formKey = GlobalKey<FormState>(debugLabel: '_EmailFormState');
//   final _controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Header('Sign in with email ..'),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 24),
//                   child: TextFormField(
//                     controller: _controller,
//                     decoration: const InputDecoration(
//                       hintText: 'Enter you email',
//                     ),
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Enter your email to continue';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 16.0, horizontal: 30),
//                       child: StyledButton(
//                         onPressed: () async {
//                           if (_formKey.currentState!.validate()) {
//                             widget.callback(_controller.text);
//                           }
//                         },
//                         child: Text('NEXT'),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class RegisterForm extends StatefulWidget {
//   RegisterForm({
//     required this.registerAccount,
//     required this.cancel,
//     required this.email,
//   });
//   final String email;
//   final void Function(String email, String displayName, String password)
//       registerAccount;
//   final void Function() cancel;

//   @override
//   _RegisterFormState createState() => _RegisterFormState();
// }

// class _RegisterFormState extends State<RegisterForm> {
//   final _formKey = GlobalKey(FormState)(debugLabel: '_RegisterFormState');
//   final _emailController = TextEditingController();
//   final _displayNameController = TextEditingController();
//   final _passwordController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//   }
// }


// class AuthFunc extends StatelessWidget {
//   const AuthFunc({
//     Key? key,
//     required this.loggedIn,
//     required this.signOut,
//   }) : super(key: key);

//   final bool loggedIn;
//   final void Function() signOut;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(left: 24, bottom: 8),
//           child: StyledButton(
//               onPressed: () {
//                 !loggedIn ? context.goNamed(rootRouteName) : signOut();
//               },
//               child: !loggedIn ? const Text('RSVP') : const Text('Logout')),
//         ),
//         Visibility(
//             visible: loggedIn,
//             child: Padding(
//               padding: const EdgeInsets.only(left: 24, bottom: 8),
//               child: StyledButton(
//                   onPressed: () {
//                     Navigator.of(context).pushNamed('/profile');
//                   },
//                   child: const Text('Profile')),
//             ))
//       ],
//     );
//   }
// }

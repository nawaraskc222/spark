import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spark/constants.dart';
import 'package:spark/ui/signin_screen.dart';
import '../login_state.dart';
import '../ui/ask_name.dart';
import '../ui/error_page.dart';
import '../ui/initialapp_page.dart';
import '../ui/signup_screen.dart';
import '../ui/home_screen.dart';
import '../ui/signin_screen.dart';

class MyRouter {
  final LoginState loginState;

  MyRouter(this.loginState);

  late final router = GoRouter(
      refreshListenable: loginState,
      debugLogDiagnostics: true,
      urlPathStrategy: UrlPathStrategy.path,
      routes: [
        GoRoute(
          name: rootRouteName,
          path: '/',
          pageBuilder: (context, state) => MaterialPage<void>(
            key: state.pageKey,
            child: const MyHomePage(),
          ),
        ),
        GoRoute(
          name: createAccountRouteName,
          path: '/create-account',
          pageBuilder: (context, state) => MaterialPage<void>(
            key: state.pageKey,
            child: RegistrationScreen(),
          ),
        ),
        GoRoute(
          name: homeRouteName,
          path: '/home',
          pageBuilder: (context, state) => MaterialPage<void>(
            key: state.pageKey,
            child: HomeScreen(),
          ),
        ),
        GoRoute(
          name: signInRouteName,
          path: '/signIn',
          pageBuilder: (context, state) => MaterialPage<void>(
            key: state.pageKey,
            child: SignInScreen(),
          ),
        ),
      ],
      errorPageBuilder: (context, state) => MaterialPage<void>(
            key: state.pageKey,
            child: ErrorPage(error: state.error),
          ),

      //redirect to Main Page if user is not logged in
      redirect: (state) {
        // final createAccountLoc = state.namedLocation(createAccountRouteName);
        // final creatingAccount = state.subloc == createAccountLoc;
        // final loggedIn = loginState.loggedIn;

        // if (!loggedIn || !creatingAccount) return createAccountLoc;
        return null;
      });
}

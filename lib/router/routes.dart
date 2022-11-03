import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spark/constants.dart';
import 'package:spark/ui/signin_screen.dart';
import '../ui/askname.dart';
import '../ui/error_page.dart';
import '../ui/number.dart';
import '../ui/signup_screen.dart';
import '../application_state.dart';
import '../ui/first_screen.dart';
import '../ui/initializeAppWAuthentication.dart';

class MyRouter {
  final ApplicationState applicationState;

  MyRouter(this.applicationState);

  late final router = GoRouter(
      refreshListenable: applicationState,
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
          name: loggedOutRouteName,
          path: '/loggedOut',
          pageBuilder: (context, state) => MaterialPage<void>(
            key: state.pageKey,
            child: const LoggedOutScreen(),
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
          name: askRoutename,
          path: '/askname',
          pageBuilder: (context, state) => MaterialPage<void>(
            key: state.pageKey,
            child: const askname(),
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
        GoRoute(
          name: AskNumberRouteName,
          path: '/AskNumber',
          pageBuilder: (context, state) => MaterialPage<void>(
            key: state.pageKey,
            child: const AskNumber(),
          ),
        ),

        // GoRoute(
        //   name: homeRouteName,
        //   path: '/home',
        //   pageBuilder: (context, state) => MaterialPage<void>(
        //     key: state.pageKey,
        //     child: HomeScreen(),
        //   ),
        // ),

//
      ],
      errorPageBuilder: (context, state) => MaterialPage<void>(
            key: state.pageKey,
            child: ErrorPage(error: state.error),
          ),

      //redirect to Main Page if user is not logged in
      redirect: (state) {
        // final createAccountLoc = state.namedLocation(createAccountRouteName);
        // final creatingAccount = state.subloc == createAccountLoc;
        // final loggedIn = ApplicationState.loggedIn;

        // if (!loggedIn || !creatingAccount) return createAccountLoc;
        return null;
      });
}

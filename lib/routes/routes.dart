import 'package:flutter/material.dart';
import 'package:flutter_retrofit/practice/riverpod_practice.dart';
import 'package:flutter_retrofit/providers/auth_state_notifier_provider.dart';
import 'package:flutter_retrofit/providers/token_provider.dart';
import 'package:flutter_retrofit/screen/groups_screen.dart';
import 'package:flutter_retrofit/screen/login_screen.dart';
import 'package:flutter_retrofit/screen/welcome_screen.dart';
import 'package:flutter_retrofit/states/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import '../util/global_values.dart';

class Routes {
  static const String dashboard = '/';
  static const String viewLevelAndClass = '/attributes';
  static const String courses = "/courses";
  static const String createCourse = "/courses/create";
  static const String assetLibrary = '/asset-library';
  static const String subjects = '/subjects';
  static const String createSubject = '$subjects/create';
  static const String login = '/login';
  static const String students = '/students';
  static const String questionBank = '/question-bank';
  static const String test = '/test';
  static const String createUser = "/create-user";
}

final appRouteMap = RouteMap(
  routes: {
    Routes.dashboard: (_) => const MaterialPage(child: WelcomeScreen()),
    // Routes.test: (_) => const NoAnimationPage(child: TestScreen()),
    // Routes.viewLevelAndClass: (_) =>
    // const NoAnimationPage(child: AttributeScreen()),
    // Routes.assetLibrary: (_) =>
    // const NoAnimationPage(child: AssetLibraryScreen()),
    // Routes.createSubject: (_) =>
    // const NoAnimationPage(child: CreateSubjectScreen()),
    // Routes.subjects: (_) =>
    // const NoAnimationPage(child: SubjectOverviewScreen()),
    // Routes.courses: (_) => const NoAnimationPage(child: CourseScreen()),
    // Routes.createCourse: (_) =>
    // const NoAnimationPage(child: CreateCourseScreen()),
    // Routes.createUser: (_) => const NoAnimationPage(
    //   child: CreateUserScreen(),
    // ),
    // Routes.students: (_) =>
    // const NoAnimationPage(child: StudentsOverviewScreen()),
    // Routes.questionBank: (_) =>
    // const NoAnimationPage(child: QuestionBankScreen()),
  },
  onUnknownRoute: (_) => const Redirect('/'),
);

final routes = RouteMap(routes: {
  '/': (_) => MaterialPage(
          child: Consumer(builder: (BuildContext context, WidgetRef ref, _) {
        final authState = ref.watch(authNotifierProvider.notifier).state;
        return authState.isAuthenticated
            ? const WelcomeScreen()
            : const LoginScreen();
      })),
  '/dashboard': (_) => const MaterialPage(
        child: WelcomeScreen(),
      ),
});

// final authRouteMap = RouteMap(
//   routes: {
//     '/': (_) => const Redirect('/login'),
//     Routes.login: (_) => const NoAnimationPage(child: LoginScreen()),
//   },
//   onUnknownRoute: (_) => const Redirect('/login'),
// );

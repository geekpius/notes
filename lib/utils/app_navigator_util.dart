import 'package:blog/models/note_model.dart';
import 'package:blog/views/home_view.dart';
import 'package:blog/views/login_view.dart';
import 'package:blog/views/note_detail_view.dart';
import 'package:flutter/material.dart';
import '../views/splash_view.dart';
import 'constants.dart';

class AppNavigatorUtil {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case AppRoute.splashView:
        return MaterialPageRoute(builder: (context) => const SplashView());

      case AppRoute.homeView:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const HomeView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );

      case AppRoute.loginView:
        return MaterialPageRoute(builder: (context) => const LoginView());

      case AppRoute.noteDetailView:
        return MaterialPageRoute(builder: (context) => NoteDetailView(note: args as NoteModel));

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return const Scaffold(
        backgroundColor: kPrimaryWhite,
        body: Center(
          child: Text('Page Not Found!', style: TextStyle(fontSize: 16)),
        ),
      );
    });
  }

  static Future<Object?> pushNamed(BuildContext context, String routeName,
          {Object? arguments}) =>
      Navigator.pushNamed(context, routeName, arguments: arguments);

  static Future<Object?> pushReplacementNamed(
          BuildContext context, String routeName,
          {Object? arguments, Object? result}) =>
      Navigator.pushReplacementNamed(context, routeName,
          arguments: arguments, result: result);

  static Future<Object?> pushNamedAndRemoveUntil(
    BuildContext context,
    String routeName,
    bool Function(Route<dynamic>) predicate, {
    Object? arguments,
  }) =>
      Navigator.pushNamedAndRemoveUntil(
        context,
        routeName,
        predicate,
        arguments: arguments,
      );

  static void pop(BuildContext context, [Object? result]) =>
      Navigator.pop(context, result);

  static NavigatorState of(BuildContext context, {bool rootNavigator = false}) =>
      Navigator.of(context, rootNavigator: rootNavigator);

  static Future<Object?> popAndPushNamed(
    BuildContext context,
    String routeName, {
    Object? arguments,
    Object? result,
  }) =>
      Navigator.popAndPushNamed(
        context,
        routeName,
        arguments: arguments,
        result: result,
      );
}

class AppRoute {
  static const splashView = 'splash_view';
  static const homeView = 'home_view';
  static const noteDetailView = 'note_detail_view';
  static const loginView = 'login_view';

}

import 'package:go_router/go_router.dart';
import 'package:toing_clone/features/auth/presentation/screen/login_screen.dart';
import 'package:toing_clone/features/auth/presentation/screen/on_boarding_screen.dart';
import 'package:toing_clone/features/auth/presentation/screen/splash_screen.dart';
import 'package:toing_clone/features/home/presentation/screen/home_screen.dart';

class AppRouter {
  static const String root = "/";
  static const String onBoardingScreen = "/OnBoardingScreen";
  static const String homeScreen = "/HomeScreen";
  static const String loginScreen = "/LoginScreen";

  static GoRouter router = GoRouter(
    initialLocation: root,
    routes: [
      GoRoute(
        path: root,
        builder: (context, state) {
          return SplashScreen();
        },
      ),
      GoRoute(
        path: onBoardingScreen,
        builder: (context, state) {
          return OnBoardingScreen();
        },
      ),
      GoRoute(
        path: loginScreen,
        builder: (context, state) {
          return LoginScreen();
        },
      ),
      GoRoute(
        path: homeScreen,
        builder: (context, state) {
          return HomeScreen();
        },
      ),
    ],
  );
}

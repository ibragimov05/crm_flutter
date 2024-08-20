import 'package:crm_flutter/ui/screens/auth/login/login_screen.dart';
import 'package:crm_flutter/ui/screens/auth/register/register_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String loginScreen = '/loginScreen';
  static const String registerScreen = '/registerScreen';
  static const String splashScreen = '/splashScreen';

  static final config = GoRouter(
    initialLocation: loginScreen,
    routes: [
      GoRoute(
        path: loginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: registerScreen,
        builder: (context, state) => const RegisterScreen(),
      ),
    ],
  );
}

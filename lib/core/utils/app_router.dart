import 'package:crm_flutter/ui/screens/auth/login/login_screen.dart';
import 'package:crm_flutter/ui/screens/auth/register/register_screen.dart';
import 'package:crm_flutter/ui/screens/home/home_screen.dart';
import 'package:crm_flutter/ui/screens/splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';

class AppRouter {
  static const String loginScreen = '/loginScreen';
  static const String registerScreen = '/registerScreen';
  static const String splashScreen = '/splashScreen';
  static const String homeScreen = '/homeScreen';

  static PageRoute _buildPageRoute(Widget widget) {
    return CupertinoPageRoute(builder: (BuildContext context) => widget);
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouter.loginScreen:
        return _buildPageRoute(const LoginScreen());
      case AppRouter.registerScreen:
        return _buildPageRoute(const RegisterScreen());
      case AppRouter.splashScreen:
        return _buildPageRoute(const SplashScreen());
      case AppRouter.homeScreen:
        return _buildPageRoute(const HomeScreen());
      default:
        return _buildPageRoute(const LoginScreen());
    }
  }
}

import 'package:crm_flutter/core/utils/app_colors.dart';
import 'package:crm_flutter/ui/screens/auth/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.mainBackground,
        ),
        scaffoldBackgroundColor: AppColors.mainBackground,
        textTheme: GoogleFonts.nunitoSansTextTheme(Theme.of(context).textTheme),
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: Color(0xFF3F8CFF).withOpacity(0.1),
          selectionHandleColor: Color(0xFF3F8CFF),
          cursorColor: Color(0xFF3F8CFF),
        )
      ),
      home: const LoginScreen(),
    );
  }
}

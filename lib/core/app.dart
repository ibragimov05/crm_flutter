import 'package:crm_flutter/core/utils/app_colors.dart';
import 'package:crm_flutter/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toastification/toastification.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.mainBackground,
          ),
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            },
          ),
          scaffoldBackgroundColor: AppColors.mainBackground,
          textTheme: GoogleFonts.nunitoSansTextTheme(Theme.of(context).textTheme),
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: const Color(0xFF3F8CFF).withOpacity(0.1),
            selectionHandleColor: const Color(0xFF3F8CFF),
            cursorColor: const Color(0xFF3F8CFF),
          ),
        ),
        routerConfig: AppRouter.config,
      ),
    );
  }
}

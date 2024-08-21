import 'package:crm_flutter/ui/screens/auth/login/login_screen.dart';
import 'package:crm_flutter/ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/device_screen.dart';
import '../../../logic/bloc/auth/auth_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _collectUserData().then(
      (value) {
        _toTheNextScreen();
      },
    );
  }

  Future<void> _collectUserData() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  Future<void> _toTheNextScreen() async {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return BlocBuilder<AuthBloc, AuthState>(
            bloc: context.read<AuthBloc>()
              ..add(const AuthEvent.checkTokenExpiry()),
            builder: (context, state) {
              if (state.authStatus == AuthStatus.authenticated) {
                return const HomeScreen();
              } else {
                return const LoginScreen();
              }
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: DeviceScreen.h(context),
        width: DeviceScreen.w(context),
        decoration: const BoxDecoration(color: Colors.blue),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: DeviceScreen.w(context) / 1.5,
                child: const Text(
                  'Get Cooking',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Simple way to find Tasty Recipe',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

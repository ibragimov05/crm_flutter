import 'package:crm_flutter/core/utils/user_constants.dart';
import 'package:crm_flutter/core/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

part 'widgets/home_screen_private_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const _AppBar(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                children: const [
                  _WelcomeBack(),
                  _DashBoard(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

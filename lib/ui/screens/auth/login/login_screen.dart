import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../../app_config.dart';
import '../../../widgets/widgets.dart';
import '../../../../core/utils/utils.dart';
import '../../../../logic/bloc/auth/auth_bloc.dart';
import '../../../../logic/cubit/login_form_cubit/login_form_cubit.dart';

part 'widgets/login_screen_private_widgets.dart';

part 'github_auth_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt.get<LoginFormCubit>(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.authStatus == AuthStatus.error) {
            AppFunction.showToast(
              message: state.error ?? 'Authentication failure',
              isSuccess: false,
              context: context,
            );
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const _MainText(),
                const _LoginInToMilliyma(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FilledButton(
                      onPressed: () => context
                          .read<AuthBloc>()
                          .add(const AuthEvent.socialLogin(
                            type: SocialLoginType.google,
                          )),
                      child: const Text('Google'),
                    ),
                    FilledButton(
                      onPressed: () async => await GitHubSignInProvider()
                          .signInWithGitHub(context),
                      child: const Text('GitHub'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


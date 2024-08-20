import 'package:crm_flutter/app_config.dart';
import 'package:crm_flutter/core/utils/app_functions.dart';
import 'package:crm_flutter/core/utils/app_router.dart';
import 'package:crm_flutter/core/utils/text_input_formatters.dart';
import 'package:crm_flutter/data/repositories/auth_repository.dart';
import 'package:crm_flutter/logic/cubit/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../../core/utils/utils.dart' hide AppConstants;
import '../../../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt.get<LoginCubit>(),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.status.isFailure) {
            AppFunction.showToast(
              message: state.errorMessage ?? 'Authentication failure',
              isSuccess: false,
              context: context,
            );
          }
        },
        child: const Scaffold(
          body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _MainText(),
                _SignInToMilliyma(),
                SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MainText extends StatelessWidget {
  const _MainText();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: SvgPicture.asset(
            AppAssets.icoLogo,
          ),
        ),
        16.sizedBoxW,
        Text(
          'Milliyma',
          style: AppTextStyles.nunitoSansW700.copyWith(
            color: const Color(0xFF3A89FF),
            fontSize: 20,
          ),
        )
      ],
    );
  }
}

class _SignInToMilliyma extends StatelessWidget {
  const _SignInToMilliyma();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: DeviceScreen.h(context) / 1.8,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: AppColors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Sign In to Milliyma',
            style: AppTextStyles.nunitoSansW700.copyWith(
              fontSize: 18,
            ),
          ),
          const _PhoneNumberInput(),
          const _PasswordInput(),
          const _LoginButton(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ZoomTapAnimation(
                onTap: () {},
                child: Text(
                  'Forgot Password?',
                  style: AppTextStyles.nunitoSansW500.copyWith(
                    color: AppColors.grayishBlue,
                  ),
                ),
              ),
            ],
          ),
          ZoomTapAnimation(
            onTap: () => context.push(AppRouter.registerScreen),
            child: Text(
              'Don’t have an account?',
              style: AppTextStyles.nunitoSansW600.copyWith(
                fontSize: 16,
                color: AppColors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PhoneNumberInput extends StatelessWidget {
  const _PhoneNumberInput();

  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (LoginCubit cubit) => cubit.state.phoneNumber.displayError,
    );

    return AppTextFormField(
      onChanged: (phoneNumber) =>
          context.read<LoginCubit>().phoneNumberChanged(phoneNumber),
      inputFormatters: [TextInputFormatters.phoneNumber],
      hintText: '+998 99 123 45 67',
      labelText: 'Phone number',
      errorText: displayError != null ? 'Invalid phone number' : null,
      textInputAction: TextInputAction.next,
      textInputType: TextInputType.phone,
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput();

  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (LoginCubit cubit) => cubit.state.password.displayError,
    );
    return AppTextFormField(
      textInputAction: TextInputAction.done,
      onChanged: (password) =>
          context.read<LoginCubit>().passwordChanged(password),
      labelText: 'Password',
      hintText: '********',
      isObscure: true,
      errorText: displayError != null ? 'Enter valid password' : null,
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    final isInProgress = context.select(
      (LoginCubit cubit) => cubit.state.status.isInProgress,
    );

    final isValid = context.select((LoginCubit cubit) => cubit.state.isValid);

    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return AppRegularButton(
          buttonLabel: 'Sign in',
          onTap: isValid && !isInProgress
              ? () => context.read<LoginCubit>().loginWithCredentials()
              : null,
          shouldAddIcon: true,
        );
      },
    );
  }
}

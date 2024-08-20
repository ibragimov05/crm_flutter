import 'package:crm_flutter/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/text_input_formatters.dart';
import '../../../../logic/cubit/login_cubit/login_cubit.dart';
import '../../../widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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


    return AppTextFormField(
      onChanged: (phoneNumber){},
      inputFormatters: [TextInputFormatters.phoneNumber],
      hintText: '+998 99 123 45 67',
      labelText: 'Phone number',
      errorText: false != null ? 'Invalid phone number' : null,
      textInputAction: TextInputAction.next,
      textInputType: TextInputType.phone,
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput();

  @override
  Widget build(BuildContext context) {

    return AppTextFormField(
      textInputAction: TextInputAction.done,
      onChanged: (password) {},
      labelText: 'Password',
      hintText: '********',
      isObscure: true,
      errorText: false != null ? 'Enter valid password' : null,
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {

    return AppRegularButton(
      buttonLabel: 'Sign in',
      onTap: false
          ? () => context.read<LoginCubit>().loginWithCredentials()
          : null,
      shouldAddIcon: true,
    );
  }
}

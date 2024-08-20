import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../../app_config.dart';
import '../../../widgets/widgets.dart';
import '../../../../core/utils/utils.dart';
import '../../../../logic/cubit/register_cubit/register_cubit.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt.get<RegisterCubit>(),
      child: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if(state.status.isSuccess){
            Navigator.of(context).pop();
          }
          else if (state.status.isFailure) {
            AppFunction.showToast(
              message: state.errorMessage ?? 'Authentication failure',
              isSuccess: false,
              context: context,
            );
          }
        },
        child: Scaffold(
          body: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.only(right: 20, left: 20, top: 50),
            children: [
              const _MainText(),
              40.sizedBoxH,
              const _RegisterInToMilliyma(),
              const SizedBox(),
            ],
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

class _RegisterInToMilliyma extends StatelessWidget {
  const _RegisterInToMilliyma();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: DeviceScreen.h(context) / 1.4,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: AppColors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Register to Milliyma',
            style: AppTextStyles.nunitoSansW700.copyWith(
              fontSize: 18,
            ),
          ),
          const _NameInput(),
          const _PhoneNumberInput(),
          const _PasswordInput(),
          const _PasswordConfirmationInput(),
          const _RegisterButton(),
          ZoomTapAnimation(
            onTap: () => context.pop(),
            child: Text(
              'Already Registered?',
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

class _NameInput extends StatelessWidget {
  const _NameInput();

  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (RegisterCubit cubit) => cubit.state.name.displayError,
    );

    return AppTextFormField(
      textInputAction: TextInputAction.done,
      onChanged: (name) => context.read<RegisterCubit>().nameChanged(name),
      labelText: 'Your name',
      hintText: 'Alex',
      errorText: displayError != null ? 'Only letters are allowed' : null,
    );
  }
}

class _PhoneNumberInput extends StatelessWidget {
  const _PhoneNumberInput();

  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (RegisterCubit cubit) => cubit.state.phoneNumber.displayError,
    );

    return AppTextFormField(
      onChanged: (phoneNumber) =>
          context.read<RegisterCubit>().phoneNumberChanged(phoneNumber),
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
      (RegisterCubit cubit) => cubit.state.password.displayError,
    );
    return AppTextFormField(
      textInputAction: TextInputAction.done,
      onChanged: (password) =>
          context.read<RegisterCubit>().passwordChanged(password),
      labelText: 'Password',
      hintText: '********',
      isObscure: true,
      errorText: displayError != null ? 'Enter valid password' : null,
    );
  }
}

class _PasswordConfirmationInput extends StatelessWidget {
  const _PasswordConfirmationInput();

  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (RegisterCubit cubit) => cubit.state.password.displayError,
    );
    return AppTextFormField(
      textInputAction: TextInputAction.done,
      onChanged: (passwordConfirmation) => context
          .read<RegisterCubit>()
          .confirmedPasswordChanged(passwordConfirmation),
      labelText: 'Confirm Password',
      hintText: '********',
      isObscure: true,
      errorText: displayError != null ? 'Password does not match' : null,
    );
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton();

  @override
  Widget build(BuildContext context) {
    final isInProgress = context.select(
      (RegisterCubit cubit) => cubit.state.status.isInProgress,
    );

    final isValid = context.select((RegisterCubit cubit) => cubit.state.isValid);

    return AppRegularButton(
      buttonLabel: 'Register',
      onTap: isValid && !isInProgress
          ? () => context.read<RegisterCubit>().signUpFormSubmitted()
          : null,
      shouldAddIcon: true,
    );
  }
}

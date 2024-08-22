import 'package:crm_flutter/core/utils/utils.dart';
import 'package:crm_flutter/logic/cubit/edit_profile_form_cubit/edit_profile_form_cubit.dart';
import 'package:crm_flutter/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileWidget extends StatelessWidget {
  const EditProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Divider(color: AppColors.grey.withOpacity(0.5)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const _NameInput(),
              10.sizedBoxH,
              const _EmailInput(),
              10.sizedBoxH,
              const _PhoneNumberInput(),
              30.sizedBoxH,
              const _SaveButton(),
            ],
          ),
        ),
      ],
    );
  }
}

class _NameInput extends StatelessWidget {
  const _NameInput();

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      labelText: 'Name',
      onChanged: (name) => context.read<EditProfileFormCubit>().nameChanged(
            previousName: UserData.name,
            value: name,
          ),
      initialValue: UserData.name == 'null' ? '' : UserData.name,
      textInputType: TextInputType.name,
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      labelText: 'Email',
      onChanged: (email) => context.read<EditProfileFormCubit>().emailChanged(
            previousEmail: UserData.email,
            value: email,
          ),
      initialValue: UserData.email == 'null' ? '' : UserData.email,
      textInputType: TextInputType.emailAddress,
    );
  }
}

class _PhoneNumberInput extends StatelessWidget {
  const _PhoneNumberInput();

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      labelText: 'Phone',
      inputFormatters: [TextInputFormatters.phoneNumber],
      onChanged: (phoneNumber) =>
          context.read<EditProfileFormCubit>().phoneNumberChanged(
                previousPhoneNumber: UserData.phone,
                value: phoneNumber,
              ),
      initialValue: UserData.phone == 'Phone' ? '' : UserData.phone,
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton();

  @override
  Widget build(BuildContext context) {
    final isValid = context.select(
      (EditProfileFormCubit cubit) => cubit.state.isValid,
    );

    return AppRegularButton(
      buttonLabel: 'Save',
      onTap: isValid ? () {} : null,
    );
  }
}

import 'package:crm_flutter/core/utils/app_assets.dart';
import 'package:crm_flutter/core/utils/app_colors.dart';
import 'package:crm_flutter/core/utils/app_text_styles.dart';
import 'package:crm_flutter/core/utils/extensions.dart';
import 'package:crm_flutter/ui/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const _MainText(),
            20.sizedBoxH,
            const _SignInToMilliyma(),
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
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: AppColors.white,
      ),
      child: Column(
        children: [
          Text(
            'Sign In to Milliyma',
            style: AppTextStyles.nunitoSansW700.copyWith(
              fontSize: 18,
            ),
          ),
          AppTextFormField(
            controller: TextEditingController(),
            validator: (p0) => null,
            hintText: 'youremail@gmail.com',
            labelText: 'Email address',
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.emailAddress,
          ),
          AppTextFormField(
            controller: TextEditingController(),
            validator: (p0) => null,
            isObscure:true,
          ),
        ],
      ),
    );
  }
}

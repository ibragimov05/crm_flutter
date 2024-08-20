import 'package:crm_flutter/core/utils/app_assets.dart';
import 'package:crm_flutter/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?) validator;
  final String? labelText;
  final String? hintText;
  final bool isObscure;
  final TextInputType textInputType;
  final TextInputAction textInputAction;

  const AppTextFormField({
    super.key,
    required this.controller,
    required this.validator,
    this.labelText,
    this.hintText,
    this.isObscure = false,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.isObscure;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _isObscure,
      decoration: InputDecoration(
        suffixIcon: _passwordToggleObscure(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Color(0xFFD8E0F0),
            width: 1.3,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Color(0xFF3F8CFF),
            width: 1.3,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Color(0xFFD8E0F0),
            width: 1.3,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Color(0xFFD8E0F0),
            width: 1.3,
          ),
        ),
        hintText: widget.hintText,
        hintStyle: AppTextStyles.nunitoSansW600.copyWith(
          color: const Color(0xFF7D8592),
        ),
      ),
    );
  }

  Widget? _passwordToggleObscure() => widget.isObscure
      ? GestureDetector(
          onTap: () => setState(() => _isObscure = !_isObscure),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SvgPicture.asset(
              _isObscure ? AppAssets.passwordEyeSlash : AppAssets.passwordEye,
            ),
          ),
        )
      : null;
}

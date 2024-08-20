import 'package:formz/formz.dart';

/// Validation errors for the [Name] [FormzInput]
enum NameValidationError {
  /// Generic invalid error
  invalid,
}

/// Form input for an name input.
class Name extends FormzInput<String, NameValidationError> {
  const Name.pure() : super.pure('');

  const Name.dirty([super.value = '']) : super.dirty();

  static final RegExp _nameRegExp = RegExp(r"^[A-Za-zÀ-ÿ' -]{2,50}$");

  @override
  NameValidationError? validator(String? value) {
    return _nameRegExp.hasMatch(value ?? '')
        ? null
        : NameValidationError.invalid;
  }
}

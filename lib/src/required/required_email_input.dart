import 'package:dart_form_inputz/dart_form_inputz.dart';

class RequiredEmailInput extends EmailInput {
  const RequiredEmailInput.pure(String? value) : super.pure(value);

  const RequiredEmailInput.dirty(String? value) : super.dirty(value);

  @override
  EmailValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return EmailValidationError.empty;
    }

    return super.validator(value);
  }
}

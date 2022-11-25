import 'package:dart_form_inputz/dart_form_inputz.dart';

class RequiredPhoneInput extends PhoneInput {
  const RequiredPhoneInput.pure(String? value) : super.pure(value);

  const RequiredPhoneInput.dirty(String? value) : super.dirty(value);

  @override
  PhoneValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return PhoneValidationError.empty;
    }

    return super.validator(value);
  }
}

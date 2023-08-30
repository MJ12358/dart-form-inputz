part of dart_form_inputz;

class RequiredPhoneInput extends PhoneInput {
  RequiredPhoneInput.pure(String? value) : super.pure(value);

  RequiredPhoneInput.dirty(String? value) : super.dirty(value);

  @override
  PhoneValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return PhoneValidationError.empty;
    }

    return super.validator(value);
  }
}

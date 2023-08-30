part of dart_form_inputz;

class RequiredEmailInput extends EmailInput {
  RequiredEmailInput.pure(String? value) : super.pure(value);

  RequiredEmailInput.dirty(String? value) : super.dirty(value);

  @override
  EmailValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return EmailValidationError.empty;
    }

    return super.validator(value);
  }
}

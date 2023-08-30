part of dart_form_inputz;

class RequiredSecondsInput extends SecondsInput {
  RequiredSecondsInput.pure(Object? value) : super.pure(value);

  RequiredSecondsInput.dirty(Object? value) : super.dirty(value);

  @override
  NumberValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return NumberValidationError.empty;
    }

    return super.validator(value);
  }
}

part of dart_form_inputz;

class RequiredMinutesInput extends MinutesInput {
  RequiredMinutesInput.pure(Object? value) : super.pure(value);

  RequiredMinutesInput.dirty(Object? value) : super.dirty(value);

  @override
  NumberValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return NumberValidationError.empty;
    }

    return super.validator(value);
  }
}

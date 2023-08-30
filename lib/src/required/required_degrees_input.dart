part of dart_form_inputz;

class RequiredDegreesInput extends DegreesInput {
  RequiredDegreesInput.pure(Object? value) : super.pure(value);

  RequiredDegreesInput.dirty(Object? value) : super.dirty(value);

  @override
  NumberValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return NumberValidationError.empty;
    }

    return super.validator(value);
  }
}

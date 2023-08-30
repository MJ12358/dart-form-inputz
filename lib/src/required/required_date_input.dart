part of dart_form_inputz;

class RequiredDateInput extends DateInput {
  RequiredDateInput.pure(
    DateTime? value, {
    DateTime? min,
    DateTime? max,
  }) : super.pure(
          value,
          min: min,
          max: max,
        );

  RequiredDateInput.dirty(DateTime? value) : super.dirty(value);

  @override
  DateValidationError? validator(DateTime? value) {
    if (value == null) {
      return DateValidationError.empty;
    }

    return super.validator(value);
  }
}

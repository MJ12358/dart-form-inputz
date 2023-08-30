part of dart_form_inputz;

class RequiredNumberInput extends NumberInput {
  RequiredNumberInput.pure(
    Object? value, {
    num? min,
    num? max,
  }) : super.pure(
          value,
          min: min,
          max: max,
        );

  RequiredNumberInput.dirty(Object? value) : super.dirty(value);

  @override
  NumberValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return NumberValidationError.empty;
    }

    return super.validator(value);
  }
}

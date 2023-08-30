part of dart_form_inputz;

class RequiredDayInput extends DayInput {
  RequiredDayInput.pure(Object? value) : super.pure(value);

  RequiredDayInput.dirty(
    Object? value, {
    required month,
  }) : super.dirty(value, month: month);

  @override
  NumberValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return NumberValidationError.empty;
    }

    return super.validator(value);
  }
}

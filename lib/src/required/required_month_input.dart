part of dart_form_inputz;

class RequiredMonthInput extends MonthInput {
  RequiredMonthInput.pure(String? value) : super.pure(value);

  RequiredMonthInput.dirty(String? value) : super.dirty(value);

  @override
  NumberValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return NumberValidationError.empty;
    }

    return super.validator(value);
  }
}

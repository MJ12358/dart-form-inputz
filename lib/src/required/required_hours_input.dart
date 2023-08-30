part of dart_form_inputz;

class RequiredHoursInput extends HoursInput {
  RequiredHoursInput.pure(Object? value) : super.pure(value);

  RequiredHoursInput.dirty(Object? value) : super.dirty(value);

  @override
  NumberValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return NumberValidationError.empty;
    }

    return super.validator(value);
  }
}

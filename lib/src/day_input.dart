part of dart_form_inputz;

class DayInput extends NumberInput {
  DayInput.pure(Object? value)
      : month = MonthInput.pure(''),
        super.pure(
          value,
          min: 0,
          max: 31,
        );

  DayInput.dirty(
    Object? value, {
    required this.month,
  }) : super.dirty(value);

  final MonthInput month;

  @override
  NumberValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    final int? i = int.tryParse(value);

    if (i == null) {
      return NumberValidationError.invalid;
    }

    if (i > month.daysInMonth) {
      return NumberValidationError.invalid;
    }

    return super.validator(value);
  }
}

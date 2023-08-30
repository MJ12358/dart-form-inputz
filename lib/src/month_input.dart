part of dart_form_inputz;

class MonthInput extends NumberInput {
  MonthInput.pure(Object? value)
      : super.pure(
          value,
          min: 0,
          max: 12,
        );

  MonthInput.dirty(Object? value) : super.dirty(value);

  // dont want to deal with leap year (so set year to "1")
  int get daysInMonth {
    final int month = int.tryParse(value) ?? 1;
    return DateTime(1, month + 1, 0).day;
  }
}

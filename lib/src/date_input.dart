part of dart_form_inputz;

enum DateValidationError {
  empty,
  invalid,
  minOutOfRange,
  maxOutOfRange,
}

class DateInput extends FormzInput<DateTime?, DateValidationError> {
  // TODO: do you want to make the "value" a named parameter??????
  DateInput.pure(
    DateTime? value, {
    DateTime? min,
    DateTime? max,
  }) : super.pure(value) {
    _min = min;
    _max = max;
  }

  DateInput.dirty(DateTime? value) : super.dirty(value);

  static DateTime? _min;
  static DateTime? _max;

  @override
  DateValidationError? validator(DateTime? value) {
    if (value == null) {
      return null;
    }

    if (_min != null && value.isBefore(_min!)) {
      return DateValidationError.minOutOfRange;
    }

    if (_max != null && value.isAfter(_max!)) {
      return DateValidationError.maxOutOfRange;
    }

    return null;
  }
}

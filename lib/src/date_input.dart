import 'package:formz/formz.dart';

enum DateValidationError {
  empty,
  invalid,
  minOutOfRange,
  maxOutOfRange,
}

class DateInput extends FormzInput<DateTime?, DateValidationError> {
  DateInput.pure(
    DateTime? value, {
    DateTime? min,
    DateTime? max,
  }) : super.pure(value) {
    _min = min;
    _max = max;
  }

  const DateInput.dirty(DateTime? value) : super.dirty(value);

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

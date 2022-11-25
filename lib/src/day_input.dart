import 'package:dart_form_inputz/dart_form_inputz.dart';
import 'package:formz/formz.dart';

enum DayValidationError {
  empty,
  invalid,
  outOfRange,
  outOfRangeByMonth,
}

class DayInput extends FormzInput<String, DayValidationError> {
  const DayInput.pure(String? value)
      : month = const MonthInput.pure(''),
        super.pure(value ?? '');

  const DayInput.dirty(
    String? value, {
    required this.month,
  }) : super.dirty(value ?? '');

  final MonthInput month;

  @override
  DayValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    final int? i = int.tryParse(value);

    if (i == null) {
      return DayValidationError.invalid;
    }

    if (i < 1 || i > 31) {
      return DayValidationError.outOfRange;
    }

    if (i > month.daysInMonth) {
      return DayValidationError.outOfRangeByMonth;
    }

    return null;
  }
}

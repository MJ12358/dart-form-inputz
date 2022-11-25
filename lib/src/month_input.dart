import 'package:formz/formz.dart';

enum MonthValidationError {
  empty,
  invalid,
  outOfRange,
}

class MonthInput extends FormzInput<String, MonthValidationError> {
  const MonthInput.pure(String? value) : super.pure(value ?? '');

  const MonthInput.dirty(String? value) : super.dirty(value ?? '');

  // dont want to deal with leap year (so set year to "1")
  int get daysInMonth {
    final int i = int.tryParse(value) ?? 1;
    return DateTime(1, i + 1, 0).day;
  }

  @override
  MonthValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    final int? i = int.tryParse(value);

    if (i == null) {
      return MonthValidationError.invalid;
    }

    if (i < 1 || i > 12) {
      return MonthValidationError.outOfRange;
    }

    return null;
  }
}

import 'package:dart_form_inputz/dart_form_inputz.dart';

class RequiredDayInput extends DayInput {
  const RequiredDayInput.pure(String? value) : super.pure(value);

  const RequiredDayInput.dirty(
    String? value, {
    required month,
  }) : super.dirty(value, month: month);

  @override
  DayValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return DayValidationError.empty;
    }

    return super.validator(value);
  }
}

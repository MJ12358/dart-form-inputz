import 'package:dart_form_inputz/dart_form_inputz.dart';

class RequiredMonthInput extends MonthInput {
  const RequiredMonthInput.pure(String? value) : super.pure(value);

  const RequiredMonthInput.dirty(String? value) : super.dirty(value);

  @override
  MonthValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return MonthValidationError.empty;
    }

    return super.validator(value);
  }
}

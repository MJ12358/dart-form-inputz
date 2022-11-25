import 'package:dart_form_inputz/dart_form_inputz.dart';

class RequiredTextInput extends TextInput {
  RequiredTextInput.pure(
    String? value, {
    num? min,
    num? max,
  }) : super.pure(
          value,
          min: min,
          max: max,
        );

  const RequiredTextInput.dirty(String? value) : super.dirty(value);

  @override
  TextValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return TextValidationError.empty;
    }

    return super.validator(value);
  }
}

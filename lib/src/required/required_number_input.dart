import 'package:dart_form_inputz/dart_form_inputz.dart';

class RequiredNumberInput extends NumberInput {
  RequiredNumberInput.pure(
    Object? value, {
    num? min,
    num? max,
  }) : super.pure(
          value,
          min: min,
          max: max,
        );

  RequiredNumberInput.dirty(Object? value) : super.dirty(value);

  @override
  NumberValidationError? validator(Object? value) {
    final String? result = value?.toString();

    if (result == null || result.isEmpty) {
      return NumberValidationError.empty;
    }

    return super.validator(value);
  }
}

import 'package:formz/formz.dart';

enum TextValidationError {
  empty,
  invalid,
  minOutOfRange,
  maxOutOfRange,
}

class TextInput extends FormzInput<String, TextValidationError> {
  TextInput.pure(
    String? value, {
    num? min,
    num? max,
  }) : super.pure(value ?? '') {
    _min = min;
    _max = max;
  }

  const TextInput.dirty(String? value) : super.dirty(value ?? '');

  static num? _min;
  static num? _max;

  @override
  TextValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    if (_min != null && value.length < _min!) {
      return TextValidationError.minOutOfRange;
    }

    if (_max != null && value.length > _max!) {
      return TextValidationError.maxOutOfRange;
    }

    return null;
  }
}

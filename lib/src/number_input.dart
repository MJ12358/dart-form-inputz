import 'package:formz/formz.dart';

enum NumberValidationError {
  empty,
  invalid,
  minOutOfRange,
  maxOutOfRange,
}

class NumberInput extends FormzInput<String, NumberValidationError> {
  NumberInput.pure(
    Object? value, {
    num? min,
    num? max,
  }) : super.pure(value != null ? '$value' : '') {
    _min = min;
    _max = max;
  }

  NumberInput.dirty(Object? value) : super.dirty(value != null ? '$value' : '');

  late final num? _min;
  late final num? _max;

  @override
  NumberValidationError? validator(Object? value) {
    final String? result = value?.toString();

    if (result == null || result.isEmpty) {
      return null;
    }

    final num? i = num.tryParse(result);

    if (i == null) {
      return NumberValidationError.invalid;
    }

    if (_min != null && i <= _min!) {
      return NumberValidationError.minOutOfRange;
    }

    if (_max != null && i >= _max!) {
      return NumberValidationError.maxOutOfRange;
    }

    return null;
  }
}

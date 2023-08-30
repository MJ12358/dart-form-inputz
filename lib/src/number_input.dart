part of dart_form_inputz;

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

  static num? _min;
  static num? _max;

  @override
  NumberValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    final num? i = num.tryParse(value);

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

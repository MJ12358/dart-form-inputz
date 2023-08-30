part of dart_form_inputz;

enum PasswordValidationError {
  empty,
  invalid,
}

class PasswordInput extends FormzInput<String, PasswordValidationError> {
  PasswordInput.pure({num? min}) : super.pure('') {
    _min = min;
  }

  PasswordInput.dirty(String? value) : super.dirty(value ?? '');

  static num? _min;

  @override
  PasswordValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return PasswordValidationError.empty;
    }

    if (_min != null && value.length < _min!) {
      return PasswordValidationError.invalid;
    }

    return null;
  }
}

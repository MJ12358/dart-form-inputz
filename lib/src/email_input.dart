part of dart_form_inputz;

enum EmailValidationError {
  empty,
  containsSpace,
  containsDoubleDot,
  missingAt,
  lastCharIsDot,
  invalid,
}

class EmailInput extends FormzInput<String, EmailValidationError> {
  EmailInput.pure(String? value) : super.pure(value ?? '');

  EmailInput.dirty(String? value) : super.dirty(value ?? '');

  @override
  EmailValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    if (value.contains(' ')) {
      return EmailValidationError.containsSpace;
    }

    if (value.contains('..')) {
      return EmailValidationError.containsDoubleDot;
    }

    final int at = value.indexOf('@');
    // at symbol must be present and not the first character
    if (at < 1) {
      return EmailValidationError.missingAt;
    }

    final int dot = value.lastIndexOf('.');
    // dot symbol should not be the last character
    if (dot + 1 == value.length) {
      return EmailValidationError.lastCharIsDot;
    }
    // second level domains must be at least one character
    if (dot <= at + 1) {
      return EmailValidationError.invalid;
    }
    // top level domains should be at least two characters
    if (dot == value.length - 2) {
      return EmailValidationError.invalid;
    }

    return null;
  }
}

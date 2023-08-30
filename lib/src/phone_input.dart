part of dart_form_inputz;

enum PhoneValidationError {
  empty,
  invalid,
}

class PhoneInput extends FormzInput<String, PhoneValidationError> {
  PhoneInput.pure(String? value) : super.pure(value ?? '');

  PhoneInput.dirty(String? value) : super.dirty(value ?? '');

  static const List<String> _patterns = <String>[
    'XXXXXXXXXX',
    'XXX XXX XXXX',
    'XXX XXX-XXXX',
    'XXX-XXX-XXXX',
    '(XXX)XXXXXXX',
    '(XXX)XXX-XXXX',
    '(XXX) XXX XXXX',
    '(XXX) XXX-XXXX',
    '(XXX)-XXX-XXXX'
  ];

  @override
  PhoneValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    final StringBuffer buffer = StringBuffer();

    for (int i = 0; i < value.length; i++) {
      // convert digits to ascii (48 == 0 and 57 == 9)
      final int codeUnit = value[i].codeUnitAt(0);
      // replace them with "X" otherwise value[i]
      buffer.write(codeUnit >= 48 && codeUnit <= 57 ? 'X' : value[i]);
    }

    // now verify our patterns contains the output
    if (!_patterns.contains(buffer.toString())) {
      return PhoneValidationError.invalid;
    }

    return null;
  }
}

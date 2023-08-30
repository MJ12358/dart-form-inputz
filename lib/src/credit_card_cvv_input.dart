part of dart_form_inputz;

enum CreditCardCvvValidationError {
  empty,
  invalid,
  outOfRange,
}

class CreditCardCvvInput
    extends FormzInput<String, CreditCardCvvValidationError> {
  CreditCardCvvInput.pure(String? value) : super.pure(value ?? '');

  CreditCardCvvInput.dirty(String? value) : super.dirty(value ?? '');

  @override
  CreditCardCvvValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return CreditCardCvvValidationError.empty;
    }

    final int? i = int.tryParse(value);
    if (i == null) {
      return CreditCardCvvValidationError.invalid;
    }

    // visa/master/discover are 3 but amex is 4
    if (value.length < 3 || value.length > 4) {
      return CreditCardCvvValidationError.outOfRange;
    }

    return null;
  }
}

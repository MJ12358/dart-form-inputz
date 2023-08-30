part of dart_form_inputz;

enum CreditCardExpiryValidationError {
  empty,
  invalid,
  outOfRange,
}

class CreditCardExpiryInput
    extends FormzInput<String, CreditCardExpiryValidationError> {
  CreditCardExpiryInput.pure(String? value) : super.pure(value ?? '');

  CreditCardExpiryInput.dirty(String? value) : super.dirty(value ?? '');

  @override
  CreditCardExpiryValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return CreditCardExpiryValidationError.empty;
    }

    final int? i = int.tryParse(value);

    if (i == null) {
      return CreditCardExpiryValidationError.invalid;
    }

    if (value.length != 4) {
      return CreditCardExpiryValidationError.outOfRange;
    }

    final String yearPrefix =
        _splitByLength(DateTime.now().year.toString(), 2)[0];

    final List<String> dateSplit = _splitByLength(value, 2);

    final int month = int.parse(dateSplit.first);

    final int year = int.parse('$yearPrefix${dateSplit.last}');

    final DateTime expiryDate = DateTime(year, month);

    if (expiryDate.isBefore(DateTime.now())) {
      return CreditCardExpiryValidationError.outOfRange;
    }

    if (month < 1 || month > 12) {
      return CreditCardExpiryValidationError.invalid;
    }

    return null;
  }
}

List<String> _splitByLength(String str, int length) {
  return <String>[str.substring(0, length), str.substring(length)];
}

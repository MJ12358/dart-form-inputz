part of dart_form_inputz;

enum CreditCardValidationError {
  empty,
  invalid,
  outOfRange,
}

enum CreditCardType {
  americanExpress,
  discover,
  mastercard,
  visa,
  other,
}

// https://en.wikipedia.org/wiki/Payment_card_number#Major_Industry_Identifier_.28MII.29
const Map<CreditCardType, Set<List<String>>> _patterns =
    <CreditCardType, Set<List<String>>>{
  CreditCardType.americanExpress: <List<String>>{
    <String>['34'],
    <String>['37'],
  },
  CreditCardType.discover: <List<String>>{
    <String>['6011'],
    <String>['622126', '622925'],
    <String>['644', '649'],
    <String>['65'],
  },
  CreditCardType.mastercard: <List<String>>{
    <String>['51', '55'],
    <String>['2221', '2229'],
    <String>['223', '229'],
    <String>['23', '26'],
    <String>['270', '271'],
    <String>['2720'],
  },
  CreditCardType.visa: <List<String>>{
    <String>['4'],
  }
};

class CreditCardInput extends FormzInput<String, CreditCardValidationError> {
  CreditCardInput.pure(String? value) : super.pure(value ?? '');

  CreditCardInput.dirty(String? value) : super.dirty(value ?? '');

  CreditCardType get type {
    CreditCardType cardType = CreditCardType.other;

    if (value.isEmpty) {
      return cardType;
    }

    _patterns.forEach(
      (CreditCardType type, Set<List<String>> patterns) {
        for (final List<String> patternRange in patterns) {
          String ccPatternStr = value.replaceAll(RegExp(r'\D'), '');
          final int rangeLen = patternRange[0].length;

          // Trim the Credit Card number string to match the pattern prefix
          if (rangeLen < value.length) {
            ccPatternStr = ccPatternStr.substring(0, rangeLen);
          }

          if (patternRange.length > 1) {
            final int ccPrefix = int.parse(ccPatternStr);
            final int startPatternPrefix = int.parse(patternRange[0]);
            final int endPatternPrefix = int.parse(patternRange[1]);

            if (ccPrefix >= startPatternPrefix &&
                ccPrefix <= endPatternPrefix) {
              cardType = type;
              break;
            }
          } else {
            if (ccPatternStr == patternRange[0]) {
              cardType = type;
              break;
            }
          }
        }
      },
    );

    return cardType;
  }

  @override
  CreditCardValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return CreditCardValidationError.empty;
    }

    final int? i = int.tryParse(value);

    if (i == null) {
      return CreditCardValidationError.invalid;
    }

    // visa is 13 or 16, amex is 15, others can be between 12-19
    if (value.length < 8) {
      return CreditCardValidationError.outOfRange;
    }

    // Luhn Algorithm
    // https://pub.dev/documentation/validators/latest/validators/isCreditCard.html
    int sum = 0;
    String digit;
    bool shouldDouble = false;

    for (int i = value.length - 1; i >= 0; i--) {
      digit = value.substring(i, i + 1);
      int tmpNum = int.parse(digit);

      if (shouldDouble == true) {
        tmpNum *= 2;
        if (tmpNum >= 10) {
          sum += (tmpNum % 10) + 1;
        } else {
          sum += tmpNum;
        }
      } else {
        sum += tmpNum;
      }
      shouldDouble = !shouldDouble;
    }

    if (sum % 10 != 0) {
      return CreditCardValidationError.invalid;
    }

    return null;
  }
}

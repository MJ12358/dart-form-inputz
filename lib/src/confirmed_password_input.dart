import 'package:dart_form_inputz/src/password_input.dart';
import 'package:formz/formz.dart';

enum ConfirmedPasswordValidationError {
  empty,
  invalid,
  noMatch,
}

class ConfirmedPasswordInput
    extends FormzInput<String, ConfirmedPasswordValidationError> {
  ConfirmedPasswordInput.pure()
      : original = PasswordInput.pure(),
        super.pure('');

  const ConfirmedPasswordInput.dirty(
    String? value, {
    required this.original,
  }) : super.dirty(value ?? '');

  final PasswordInput original;

  @override
  ConfirmedPasswordValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return ConfirmedPasswordValidationError.empty;
    }

    if (original.validator(value) != null) {
      return ConfirmedPasswordValidationError.invalid;
    }

    if (original.value != value) {
      return ConfirmedPasswordValidationError.noMatch;
    }

    return null;
  }
}

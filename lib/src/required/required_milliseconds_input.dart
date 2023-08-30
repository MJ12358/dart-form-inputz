part of dart_form_inputz;

class RequiredMillisecondsInput extends MillisecondsInput {
  RequiredMillisecondsInput.pure(Object? value) : super.pure(value);

  RequiredMillisecondsInput.dirty(Object? value) : super.dirty(value);

  @override
  NumberValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return NumberValidationError.empty;
    }

    return super.validator(value);
  }
}

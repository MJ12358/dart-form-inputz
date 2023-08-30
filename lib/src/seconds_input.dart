part of dart_form_inputz;

class SecondsInput extends NumberInput {
  SecondsInput.pure(Object? value)
      : super.pure(
          value,
          min: 0,
          max: 60,
        );

  SecondsInput.dirty(Object? value) : super.dirty(value);
}

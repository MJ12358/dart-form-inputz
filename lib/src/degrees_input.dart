part of dart_form_inputz;

class DegreesInput extends NumberInput {
  DegreesInput.pure(Object? value)
      : super.pure(
          value,
          min: 0,
          max: 360,
        );

  DegreesInput.dirty(Object? value) : super.dirty(value);
}

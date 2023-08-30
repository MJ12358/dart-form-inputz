part of dart_form_inputz;

class HoursInput extends NumberInput {
  HoursInput.pure(Object? value)
      : super.pure(
          value,
          min: 0,
          max: 24,
        );

  HoursInput.dirty(Object? value) : super.dirty(value);
}

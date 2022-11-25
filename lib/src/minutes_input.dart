import 'package:dart_form_inputz/dart_form_inputz.dart';

class MinutesInput extends NumberInput {
  MinutesInput.pure(Object? value)
      : super.pure(
          value,
          min: 0,
          max: 60,
        );

  MinutesInput.dirty(Object? value) : super.dirty(value);
}

import 'package:dart_form_inputz/dart_form_inputz.dart';

class MillisecondsInput extends NumberInput {
  MillisecondsInput.pure(Object? value)
      : super.pure(
          value,
          min: 0,
          max: 1000,
        );

  MillisecondsInput.dirty(Object? value) : super.dirty(value);
}

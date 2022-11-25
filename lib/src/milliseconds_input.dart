import 'package:dart_form_inputz/dart_form_inputz.dart';

class MilliSecondsInput extends NumberInput {
  MilliSecondsInput.pure(Object? value)
      : super.pure(
          value,
          min: 0,
          max: 1000,
        );

  MilliSecondsInput.dirty(Object? value) : super.dirty(value);
}

import 'package:dart_form_inputz/dart_form_inputz.dart';

class RequiredMillisecondsInput extends RequiredNumberInput {
  RequiredMillisecondsInput.pure(Object? value)
      : super.pure(
          value,
          min: 0,
          max: 1000,
        );

  RequiredMillisecondsInput.dirty(Object? value) : super.dirty(value);
}

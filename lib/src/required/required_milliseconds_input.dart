import 'package:dart_form_inputz/dart_form_inputz.dart';

class RequiredMilliSecondsInput extends RequiredNumberInput {
  RequiredMilliSecondsInput.pure(Object? value)
      : super.pure(
          value,
          min: 0,
          max: 1000,
        );

  RequiredMilliSecondsInput.dirty(Object? value) : super.dirty(value);
}

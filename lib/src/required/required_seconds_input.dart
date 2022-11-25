import 'package:dart_form_inputz/dart_form_inputz.dart';

class RequiredSecondsInput extends RequiredNumberInput {
  RequiredSecondsInput.pure(Object? value)
      : super.pure(
          value,
          min: 0,
          max: 60,
        );

  RequiredSecondsInput.dirty(Object? value) : super.dirty(value);
}

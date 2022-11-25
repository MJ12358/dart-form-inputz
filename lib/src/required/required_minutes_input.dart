import 'package:dart_form_inputz/dart_form_inputz.dart';

class RequiredMinutesInput extends RequiredNumberInput {
  RequiredMinutesInput.pure(Object? value)
      : super.pure(
          value,
          min: 0,
          max: 60,
        );

  RequiredMinutesInput.dirty(Object? value) : super.dirty(value);
}

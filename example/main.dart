import 'package:dart_form_inputz/dart_form_inputz.dart';
import 'package:formz/formz.dart';

class MyForm with FormzMixin {
  MyForm({
    TextInput? name,
    EmailInput? email,
    PhoneInput? phone,
  })  : name = name ?? TextInput.pure(''),
        email = email ?? EmailInput.pure(''),
        phone = phone ?? PhoneInput.pure('');

  TextInput name;
  EmailInput email;
  PhoneInput phone;

  @override
  List<FormzInput> get inputs => <FormzInput>[
        name,
        email,
        phone,
      ];
}

class MyController {
  MyForm myForm = MyForm();

  void onNameChanged(String? value) {
    myForm.name = TextInput.dirty(value);
  }

  void onEmailChanged(String? value) {
    myForm.email = EmailInput.dirty(value);
  }

  void onPhoneChanged(String? value) {
    myForm.phone = PhoneInput.dirty(value);
  }

  bool isFormValid() {
    return myForm.isValid;
  }
}

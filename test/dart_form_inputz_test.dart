import 'package:dart_form_inputz/dart_form_inputz.dart';
import 'package:test/test.dart';

void main() {
  test('date input', () {
    final DateInput pure = DateInput.pure(DateTime.now());
  });

  test('number input', () {
    final NumberInput pure = NumberInput.pure(0);
    final NumberInput dirty = NumberInput.dirty(123);

    expect(pure.isPure, isTrue);
    expect(dirty.isValid, isTrue);
  });

  test('text input', () {
    final TextInput pure = TextInput.pure('');
    final TextInput dirty = TextInput.dirty('value');

    expect(pure.isPure, isTrue);
    expect(dirty.isValid, isTrue);
  });
}

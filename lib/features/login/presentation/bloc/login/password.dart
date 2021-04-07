import 'package:formz/formz.dart';

enum PasswordValidation { invalid }

class Password extends FormzInput<String, PasswordValidation> {
  const Password.dirty([String value = '']) : super.dirty(value);
  const Password.pure([String value = '']) : super.pure(value);

  @override
  PasswordValidation validator(String value) {
    return value.isNotEmpty ? null : PasswordValidation.invalid;
  }
}

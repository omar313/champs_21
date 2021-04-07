import 'package:formz/formz.dart';

enum PhoneNumberValidationError { invalid }

class PhoneNumber extends FormzInput<String, PhoneNumberValidationError> {
  const PhoneNumber.pure([String value = '']) : super.pure(value);
  const PhoneNumber.dirty([String value = '']) : super.dirty(value);

  // static final _phoneRegex =
  //     RegExp(r"^(?:[+88])?[0-9]{11,14}$");

  @override
  PhoneNumberValidationError validator(String value) {
    // return _phoneRegex.hasMatch(value)
    //     ? null
    //     : PhoneNumberValidationError.invalid;

    return value.isNotEmpty ? null : PhoneNumberValidationError.invalid;
  }
}

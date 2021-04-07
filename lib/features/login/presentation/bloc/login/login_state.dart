part of 'login_cubit.dart';

class LoginState extends Equatable {
  final PhoneNumber phoneNumber;
  final Password password;
  final FormzStatus status;
  final String errorMsg;

  const LoginState( 
      {this.phoneNumber = const PhoneNumber.pure(),
      this.password = const Password.pure(),
      this.status = FormzStatus.pure,
      this.errorMsg = ''});

  LoginState copyWith(
      {PhoneNumber phoneNumber, Password password, FormzStatus status, String errorMsg}) {
    return LoginState(
        phoneNumber: phoneNumber ?? this.phoneNumber,
        password: password ?? this.password,
        status: status ?? this.status,
        errorMsg: errorMsg ?? this.errorMsg);
  }

  @override
  List<Object> get props => [this.phoneNumber, this.password, this.status, this.errorMsg];
}

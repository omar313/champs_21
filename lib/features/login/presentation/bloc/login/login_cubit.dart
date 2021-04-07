
import 'package:bloc/bloc.dart';
import 'package:champs_21/features/login/presentation/bloc/login/password.dart';
import 'package:champs_21/features/login/presentation/bloc/login/phone.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';


part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  void phoneNumberChanged(String number) {
    final phoneNumber = PhoneNumber.dirty(number);
    emit(state.copyWith(
        phoneNumber: phoneNumber.valid ? phoneNumber : PhoneNumber.pure(number),
        status: Formz.validate([phoneNumber, state.password])));
  }

  void passwordChanged(String text) {
    final password = Password.dirty(text);
    emit(state.copyWith(
        password: password.valid ? password : Password.pure(text),
        status: Formz.validate([state.phoneNumber, password])));
  }

  void phoneNumberUnfocused() {
    final phoneNumber = PhoneNumber.dirty(state.phoneNumber.value);
    emit(state.copyWith(
        phoneNumber: phoneNumber,
        status: Formz.validate([phoneNumber, state.password])));
  }

  void passwordUnfocused() {
    final password = Password.dirty(state.password.value);
    emit(state.copyWith(
        password: password,
        status: Formz.validate([state.phoneNumber, password])));
  }

  void submitted() async{
    final phoneNumber = PhoneNumber.dirty(state.phoneNumber.value);
    final password = Password.dirty(state.password.value);
    emit(state.copyWith(
      password: password,
      phoneNumber: phoneNumber,
      status: Formz.validate([phoneNumber, password])
    ));

    if(state.status.isValidated){
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      await Future.delayed(Duration(seconds: 2), );
      try{
      //  final loginResponse = await di.get<LoginRequest>().loginRequest(phoneNumber.value, password.value);
        
       emit(state.copyWith(status: FormzStatus.submissionSuccess));
      }catch(e){
          final error = e.toString();
            emit(state.copyWith(status: FormzStatus.submissionFailure,errorMsg: error));
      }
    }
  }
}

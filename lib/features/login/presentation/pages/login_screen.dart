import 'package:champs_21/constants/colors.dart';
import 'package:champs_21/features/login/presentation/bloc/login/login_cubit.dart';
import 'package:champs_21/features/login/presentation/widgets/custom_clipper.dart';
import 'package:champs_21/features/login/presentation/widgets/loader_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneNumberFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _phoneNumberFocusNode.addListener(() {
      if (!_phoneNumberFocusNode.hasFocus) {
        context.read<LoginCubit>().phoneNumberUnfocused();
        FocusScope.of(context).requestFocus(_passwordFocusNode);
      }
    });

    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        context.read<LoginCubit>().passwordUnfocused();
      }
    });
  }

  @override
  void dispose() {
    _phoneNumberFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionInProgress) {
          showDialog(context: context, builder: (context) => LoaderDialog());
        } else if (state.status.isSubmissionSuccess) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Success')),
            );
            Navigator.of(context).popAndPushNamed('/dashBoard');
        } else if (state.status.isSubmissionFailure) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(state.errorMsg)),
            );
        }
      },
      child: Scaffold(
        body: LoginBody(
          size: size,
          userNameFocusNode: _phoneNumberFocusNode,
          passwordFocusNode: _passwordFocusNode,
        ),
      ),
    );
  }
}

class LoginBody extends StatelessWidget {
  final FocusNode userNameFocusNode, passwordFocusNode;
  const LoginBody({
    Key key,
    @required this.size,
    @required this.userNameFocusNode,
    @required this.passwordFocusNode,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: size.height,
        child: Column(children: [
          ClipPath(
            clipper: CurveClipper(),
            child: Image.asset(
              'assets/images/login_background.jpg',
              height: size.height / 2.5,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            'Champs21',
            style: TextStyle(
                color: kHiglightedColor,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 10),
          ),
          SizedBox(
            height: 10,
          ),
          UserNameTextField(
            userNameFocusNode: userNameFocusNode,
          ),
          SizedBox(
            height: 10,
          ),
          PasswordTextField(passwordFocusNode: passwordFocusNode),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forget password ?',
                      style: TextStyle(color: Colors.black),
                    )),
              ],
            ),
          ),
          SizedBox(height: 30),
          Container(
            height: 45,
            margin: EdgeInsets.symmetric(
              horizontal: 60,
            ),
            decoration: BoxDecoration(
                color: kHiglightedColor,
                borderRadius: BorderRadius.circular(10)),
            child: MaterialButton(
              onPressed: context.read<LoginCubit>().submitted,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              minWidth: double.infinity,
              child: Text('Login',
                  style: TextStyle(
                      fontSize: 22,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 80,
                color: kHiglightedColor,
                alignment: Alignment.center,
                child: Text(
                  'Don\'t have any account ? Sign up',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    Key key,
    @required this.passwordFocusNode,
  }) : super(key: key);
  final FocusNode passwordFocusNode;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextField(
            focusNode: passwordFocusNode,
           onChanged: (text){
             context.read<LoginCubit>().passwordChanged(text);
           },
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15),
                errorText:
                    state.password.invalid ? 'password is not valid' : null,
                fillColor: Colors.white,
                filled: true,
                hintText: 'Password',
                prefixIcon: Icon(
                  Icons.lock,
                  size: 30,
                  color: kHiglightedColor,
                )),
            obscureText: true,
          ),
        );
      },
    );
  }
}

class UserNameTextField extends StatelessWidget {
  const UserNameTextField({
    Key key,
    @required this.userNameFocusNode,
  }) : super(key: key);

  final FocusNode userNameFocusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextField(
            focusNode: userNameFocusNode,
            onChanged: (text){
              context.read<LoginCubit>().phoneNumberChanged(text);
            },
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15),
                fillColor: Colors.white,
                filled: true,
                hintText: 'User Name',
                errorText:
                    state.phoneNumber.invalid ? 'User name is not valid' : null,
                prefixIcon: Icon(
                  Icons.account_box,
                  size: 30,
                  color: kHiglightedColor,
                )),
          ),
        );
      },
    );
  }
}

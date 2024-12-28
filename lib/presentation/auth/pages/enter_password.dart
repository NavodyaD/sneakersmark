import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakersmark/common/bloc/button/button_state.dart';
import 'package:sneakersmark/common/bloc/button/button_state_cubit.dart';
import 'package:sneakersmark/common/helper/navigator/app_navigator.dart';
import 'package:sneakersmark/common/widgets/appbar/app_bar.dart';
import 'package:sneakersmark/common/widgets/button/basic_app_button.dart';
import 'package:sneakersmark/common/widgets/button/basic_reactive_button.dart';
import 'package:sneakersmark/data/auth/models/user_signin_req.dart';
import 'package:sneakersmark/domain/auth/usecases/signin.dart';
import 'package:sneakersmark/presentation/auth/pages/forgot_password.dart';

import '../../home/pages/home.dart';

class EnterPasswordPage extends StatelessWidget {
  final UserSigninReq signinReq;
  EnterPasswordPage({
    required this.signinReq,
    super.key
  });

  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 40,
        ),
        child: BlocProvider(
          create: (context) => ButtonStateCubit(),
          // BlocListner to listen to the changes
          child: BlocListener<ButtonStateCubit,ButtonState>(
            listener: (context, state) {
              // Button Failure State
              if (state is ButtonFailureState){
                var snackbar = SnackBar(content: Text(state.errorMessage),behavior: SnackBarBehavior.floating,);
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              }
              // Button Success State - go to home page
              if (state is ButtonSuccessState) {
                AppNavigator.pushAndRemove(context, const HomePage());
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _signinText(context),
                const SizedBox(height: 20,),
                _passwordField(context),
                const SizedBox(height: 20,),
                _continueButton(context),
                const SizedBox(height: 20,),
                _forgotPassword(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _signinText(BuildContext context) {
    return const Text('Sign in', style: TextStyle(
        fontSize: 32, fontWeight: FontWeight.bold
    ),);
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _passwordCon,
      decoration: const InputDecoration(
          hintText: 'Enter Password'
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return Builder(
        builder: (context) {
          return BasicReactiveButton(
              onPressed: (){
                signinReq.password = _passwordCon.text;
                context.read<ButtonStateCubit>().execute(
                    usecase: SigninUseCase(),
                    params: signinReq
                );
              },
              title: 'Continue'
          );
        }
    );
  }

  Widget _forgotPassword(BuildContext context) {
    return RichText(
      text: TextSpan(
          children: [
            const TextSpan(
                text: "Forgot password?"
            ),
            TextSpan(
                text: 'Reset',
                recognizer: TapGestureRecognizer()..onTap = () {
                  AppNavigator.push(context, ForgotPasswordPage());
                },
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                )
            )
          ]
      ),
    );
  }
}

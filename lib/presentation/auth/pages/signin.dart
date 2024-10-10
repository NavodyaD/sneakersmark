import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sneakersmark/common/helper/navigator/app_navigator.dart';
import 'package:sneakersmark/common/widgets/button/basic_app_button.dart';
import 'package:sneakersmark/presentation/auth/pages/enter_password.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 80,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _signinText(context),
            const SizedBox(height: 20,),
            _emailField(context),
            const SizedBox(height: 20,),
            _continueButton(context),
            const SizedBox(height: 20,),
            _createAccount(context),
          ],
        ),
      ),
    );
  }

  Widget _signinText(BuildContext context) {
    return const Text('Sign in', style: TextStyle(
      fontSize: 32, fontWeight: FontWeight.bold
    ),);
  }

  Widget _emailField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Enter Email',
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(onPressed: () {
      AppNavigator.pushReplacement(context, const EnterPasswordPage()
      );
    },
    title: 'Continue',);
  }
  
  Widget _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: "Don't you have an account?"
          ),
          TextSpan(
              text: 'Create One',
            recognizer: TapGestureRecognizer()..onTap = () {

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

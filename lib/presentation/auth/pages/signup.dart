import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sneakersmark/common/helper/navigator/app_navigator.dart';
import 'package:sneakersmark/common/widgets/appbar/app_bar.dart';
import 'package:sneakersmark/common/widgets/button/basic_app_button.dart';
import 'package:sneakersmark/presentation/auth/pages/enter_password.dart';
import 'package:sneakersmark/presentation/auth/pages/signin.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _signinText(context),
            const SizedBox(height: 20,),
            _firstNameField(context),
            const SizedBox(height: 20,),
            _lastNameField(context),
            const SizedBox(height: 20,),
            _emailField(context),
            const SizedBox(height: 20,),
            _passwordField(context),
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
    return const Text('Create Account', style: TextStyle(
        fontSize: 32, fontWeight: FontWeight.bold
    ),);
  }

  Widget _firstNameField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'First Name',
      ),
    );
  }

  Widget _lastNameField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Last Name',
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Enter Email',
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: 'Password',
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(onPressed: () {
      AppNavigator.push(context, const EnterPasswordPage()
      );
    },
      title: 'Continue',);
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
          children: [
            const TextSpan(
                text: "Do you have an account?"
            ),
            TextSpan(
                text: 'Signin',
                recognizer: TapGestureRecognizer()..onTap = () {
                  AppNavigator.pushReplacement(context, const SigninPage());
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
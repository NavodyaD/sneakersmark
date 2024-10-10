import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sneakersmark/common/widgets/button/basic_app_button.dart';

class EnterPasswordPage extends StatelessWidget {
  const EnterPasswordPage({super.key});

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
            _passwordField(context),
            const SizedBox(height: 20,),
            _continueButton(),
            const SizedBox(height: 20,),
            _forgotPassword(context),
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

  Widget _passwordField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
          hintText: 'Enter Password'
      ),
    );
  }

  Widget _continueButton() {
    return BasicAppButton(onPressed: () {},
      title: 'Continue',);
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

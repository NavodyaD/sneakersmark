import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sneakersmark/common/helper/navigator/app_navigator.dart';
import 'package:sneakersmark/common/widgets/button/basic_app_button.dart';
import 'package:sneakersmark/core/configs/assets/app_vectors.dart';
import 'package:sneakersmark/presentation/auth/pages/signin.dart';

class PasswordResetEmailPage extends StatelessWidget {
  const PasswordResetEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _emailSending(),
          const SizedBox(height: 30,),
          _sentEmail(),
          const SizedBox(height: 30,),
          _returnToLoginButton(context)
        ],
      ),
    );
  }
  Widget _emailSending() {
    return const Center(
      child: Text('Sending...'),
    );
  }

  Widget _sentEmail() {
    return const Center(
      child: Text(
          'We Sent you an Email to reset your password.'
      ),
    );
  }

  Widget _returnToLoginButton(BuildContext context) {
    return BasicAppButton(
        onPressed: (){
          AppNavigator.pushReplacement(context, SigninPage());
        },
        width: 200,
        title: 'Return to Login'
    );
  }
}
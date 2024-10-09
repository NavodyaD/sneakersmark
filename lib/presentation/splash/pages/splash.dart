import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakersmark/presentation/auth/pages/signin.dart';
import 'package:sneakersmark/presentation/splash/bloc/splash_state.dart';

import '../../../core/configs/theme/app_colors.dart';
import '../bloc/splash_cubit.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit,SplashState>(
      listener:  (context, state) {
        if(state is UnAuthenticated) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const SigninPage()
              )
          );
        }
      },
      child: const Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: const Text("Sneakersmark"),
        ),
      ),
    );
  }
}

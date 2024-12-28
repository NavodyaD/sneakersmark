import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakersmark/common/helper/navigator/app_navigator.dart';
import 'package:sneakersmark/presentation/auth/pages/signin.dart';
import 'package:sneakersmark/presentation/home/pages/home.dart';
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
          AppNavigator.pushReplacement(context, SigninPage());
        }
        if(state is Authenticated) {
          AppNavigator.pushReplacement(context, HomePage());
        }
      },
      child: const Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: Text("Sneakersmark"),
        ),
      ),
    );
  }
}

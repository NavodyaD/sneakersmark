import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakersmark/core/configs/assets/app_images.dart';
import 'package:sneakersmark/domain/auth/entity/user.dart';

import '../../../core/configs/theme/app_colors.dart';
import '../bloc/user_info_display_cubit.dart';
import '../bloc/user_info_display_state.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // fetch data
      create: (context) => UserInfoDisplayCubit()..displayUserInfo(),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 40,
            right: 16,
            left: 16
        ),
        child: BlocBuilder < UserInfoDisplayCubit, UserInfoDisplayState > (
          builder: (context, state) {
            // check if the state is loading
            if (state is UserInfoLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            // check the state is loaded
            if (state is UserInfoLoaded) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _profileImage(state.user),
                  _gender(state.user),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _profileImage(UserEntity user) {
    return GestureDetector(
      onTap: (){
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: user.image.isEmpty ?
              const AssetImage(
                  AppImages.appLogo
              ) : NetworkImage(user.image)
          ) ,
            color: Colors.red,
            shape: BoxShape.circle
        ),
      ),
    );
  }

  Widget _gender(UserEntity user) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(
          horizontal: 20
      ),
      decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(100)
      ),
      child: Center(
        child: Text(
          user.gender == 1 ? 'Men' : 'Women',
          style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16
          ),
        ),
      ),
    );
  }
}

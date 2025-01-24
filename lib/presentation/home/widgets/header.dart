import 'package:flutter/material.dart';

import '../../../core/configs/theme/app_colors.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _profileImage(),
        _gender(),
      ],
    );
  }

  Widget _profileImage() {
    return GestureDetector(
      onTap: (){
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(

            color: Colors.red,
            shape: BoxShape.circle
        ),
      ),
    );
  }

  Widget _gender() {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(
          horizontal: 16
      ),
      decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(100)
      ),
      child: Center(
        child: Text(
          "Men",
          //user.gender == 1 ? 'Men' : 'Women',
          style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16
          ),
        ),
      ),
    );
  }
}

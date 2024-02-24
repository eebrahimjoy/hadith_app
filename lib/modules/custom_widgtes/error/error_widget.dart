import 'package:flutter/material.dart';
import 'package:hadith_app/utils/constants/app_colors.dart';
import 'package:hadith_app/utils/styles/dimensions.dart';

class CustomErrorWidget extends StatelessWidget {
  final String message;

  const CustomErrorWidget({
    Key? key,
   required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          message,
          style: TextStyle(
            fontSize: Dimensions.fontSize12,
            color: AppColors.baseFontColor
          ),
        ),
      ),
    );
  }
}
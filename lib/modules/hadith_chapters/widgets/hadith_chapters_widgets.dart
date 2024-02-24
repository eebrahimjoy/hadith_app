import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hadith_app/models/hadith_chapters_model/hadith_chapters_model.dart';
import 'package:hadith_app/modules/custom_widgtes/custom_widgets.dart';
import 'package:hadith_app/utils/constants/constants.dart';
import 'package:hadith_app/utils/styles/dimensions.dart';
import 'package:get/get.dart';

class HadithChaptersWidgets {

  static AppBar appBar ({required String title, VoidCallback? onTapBack}){
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      centerTitle: true,
      title: Text(title, style: TextStyles.mediumStyle(fontWeight: FontWeight.w600, color: AppColors.whiteColor),),
      leading: GestureDetector(
          onTap: onTapBack ?? () => Get.back(),
          child: Icon(Icons.arrow_back_ios_sharp, size: Dimensions.iconSize18,)),
    );
  }

  static Widget chapterCard ({required HadithChapters chapterInfo,VoidCallback? onTap}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: REdgeInsets.all(8.w),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Dimensions.radius12),
            boxShadow: [
              BoxShadow(
                  color: AppColors.shadowColor,
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: const Offset(1, 1)
              )
            ]
        ),
        child: Row(

          children: [
            Polygons.hexagon(
              child: Container(
                alignment: Alignment.center,
                color: AppColors.greyColorLight,
                child: Text('${chapterInfo.chapterId}', style: TextStyles.mediumStyle(),),
              ),
            ),
            12.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(chapterInfo.title, style: TextStyles.mediumStyle(overflow: TextOverflow.ellipsis),),
                  2.verticalSpace,
                  Text('হাদিসের রেঞ্জ: ${chapterInfo.hadisRange}', style: TextStyles.smallStyle(),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


}
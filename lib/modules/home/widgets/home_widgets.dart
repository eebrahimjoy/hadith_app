import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hadith_app/models/hadith_books_model/hadith_books_model.dart';
import 'package:hadith_app/modules/custom_widgtes/custom_widgets.dart';
import 'package:hadith_app/utils/constants/constants.dart';
import 'package:hadith_app/utils/styles/dimensions.dart';

class HomeWidgets {

  static AppBar appBar (){
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      centerTitle: true,
      title: Text('আমার হাদিস', style: TextStyles.mediumStyle(fontWeight: FontWeight.w600, color: AppColors.whiteColor),),
    );
  }

  static Widget bookCard ({required HadithBooks booksInfo, VoidCallback? onTap}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: REdgeInsets.all(4.w),
        padding: REdgeInsets.all(12.w),
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Polygons.hexagon(
              child: Container(
                alignment: Alignment.center,
                color: hexToColor(booksInfo.colorCode),
                child: Text(booksInfo.abvrCode, style: TextStyles.mediumStyle(color: AppColors.whiteColor),),
              )
            ),
            8.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${booksInfo.title} ( ${booksInfo.titleAr} )', style: TextStyles.mediumStyle(),),
                  4.verticalSpace,
                  Text('${booksInfo.numberOfHadith} টি হাদিস', style: TextStyles.smallStyle(),),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
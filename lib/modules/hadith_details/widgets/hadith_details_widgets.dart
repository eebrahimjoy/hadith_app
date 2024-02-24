import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hadith_app/models/bottom_sheet_model/bottom_sheet_model.dart';
import 'package:hadith_app/models/hadith_details_model/hadith_details_model.dart';
import 'package:hadith_app/modules/custom_widgtes/custom_widgets.dart';
import 'package:hadith_app/utils/constants/constants.dart';
import 'package:hadith_app/utils/styles/dimensions.dart';

class HadithDetailsWidgets {

  static AppBar appBar ({VoidCallback? onTapBack, required String bookName, required String chapterTitle}){
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      titleSpacing: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(bookName, style: TextStyles.mediumStyle(color: AppColors.whiteColor, fontWeight: FontWeight.w600),),
          Text(chapterTitle, style: TextStyles.smallStyle(color: AppColors.whiteColor)),
        ],
      ),
      leading: GestureDetector(
          onTap: onTapBack ?? () => Get.back(),
          child: Icon(Icons.arrow_back_ios_sharp, size: Dimensions.iconSize18,)),
    );
  }

  static Widget hadithChapter ({required String description, required String chapterNo, required String chapterTitle}){
    return Container(
      padding: REdgeInsets.all(8.w),
      width: double.maxFinite,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(text: TextSpan(
              text: chapterNo,
              style: TextStyles.mediumStyle(color: AppColors.primaryColor, fontWeight: FontWeight.w600),
              children: [
                TextSpan(
                    text: ' $chapterTitle',
                    style: TextStyles.mediumStyle(fontWeight: FontWeight.w600)
                )
              ]
          )),
          description.isNotEmpty ? Divider(height: 30.h, color: AppColors.dividerColor,) : const SizedBox.shrink(),

          description.isNotEmpty ?  Text(
            description,
            style: TextStyles.smallStyle(color: AppColors.lightFontColor),
          ) : const SizedBox.shrink()
        ],
      ),
    );
  }

  static Widget hadithSection(
      {required String abvrCode,
      required String bookColorCode,
      required HadithDetails hadithInfo,
      required VoidCallback onTapOptions}) {
    return hadithInfo.hadithId == null ? const SizedBox.shrink() : Container(
      padding: REdgeInsets.all(8.w),
      width: double.maxFinite,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          //Header
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Polygons.hexagon(
                child: Container(
                  color: hexToColor('#$bookColorCode'),
                  child: Center(child: Text(abvrCode, style: TextStyles.mediumStyle(fontWeight: FontWeight.w600, color: AppColors.whiteColor),),),),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(text: TextSpan(
                        text: 'Hadith No:',
                        style: TextStyles.mediumStyle( fontWeight: FontWeight.w600),
                        children: [
                          TextSpan(
                              text: ' ${hadithInfo.hadithId}',
                              style: TextStyles.mediumStyle(color: AppColors.primaryColor, fontWeight: FontWeight.w600)
                          )
                        ]
                    )),
                    Text('${hadithInfo.bookName}', style: TextStyles.smallStyle(color: AppColors.lightFontColor),)
                  ],
                ),
              ),
              Container(
                padding: REdgeInsets.symmetric(vertical: Dimensions.paddingVertical4, horizontal: Dimensions.paddingHorizontal8),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: hexToColor('${hadithInfo.gradeColor}'),
                    borderRadius: BorderRadius.circular(Dimensions.radius20)
                ),
                child: Text('${hadithInfo.grade}', style: TextStyles.smallStyle(color: AppColors.whiteColor),),
              ),
              10.horizontalSpace,
           GestureDetector(
             onTap: onTapOptions,
             child: Icon(Icons.more_vert, color: AppColors.greyColor,),
           )
            ],
          ),

          16.verticalSpace,
          Text('${hadithInfo.ar}', textAlign: TextAlign.right, style: TextStyles.largeStyle(fontWeight: FontWeight.w600),),

          16.verticalSpace,

          Text('${hadithInfo.narrator} থেকে বর্ণিতঃ', textAlign: TextAlign.left, style: TextStyles.mediumStyle(color: AppColors.primaryColor),),

          16.verticalSpace,
          Text('${hadithInfo.bn}', textAlign: TextAlign.left, style: TextStyles.mediumStyle(),),
        ],
      ),
    );
  }

  static bottomSheet(BuildContext context, {VoidCallback? onTapClose}) {

    showModalBottomSheet(
        useRootNavigator: true,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(Dimensions.radius16),
          ),
        ),
        context: context,
        builder: (_) => Container(
          padding: EdgeInsets.symmetric(
              vertical: Dimensions.paddingVertical6,
              horizontal: Dimensions.paddingHorizontal10),
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Row(
                children: [
                  Expanded(child: Text('More Option', style: TextStyles.mediumStyle(),)),
                  IconButton(onPressed: onTapClose ?? () => Get.back(), icon: const Icon(Icons.close))
                ],
              ),
              
              Column(
                children: List.generate(BottomSheetItems.items.length, (index) {
                  var item = BottomSheetItems.items[index];
                 return Padding(
                   padding: EdgeInsets.symmetric(vertical: Dimensions.paddingVertical6),
                   child: Row(
                     children: [
                      Icon(item.icon, color: AppColors.primaryColor,),
                     12.horizontalSpace,
                     Text(item.name, style: TextStyles.smallStyle(),)
                    ],),
                 );
                }),
              )
            ],
          )
        ));
  }

}
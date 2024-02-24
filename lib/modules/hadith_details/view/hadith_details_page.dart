import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hadith_app/modules/hadith_details/hadith_details.dart';
import 'package:hadith_app/utils/constants/app_colors.dart';
import 'package:hadith_app/utils/styles/dimensions.dart';

class HadithDetailsPage extends StatefulWidget {
  final String bookColorCode;
  final String abvrCode;
  final String bookTitle;
  final String chapterTitle;
  final int bookId;
  final int chapterId;
  const HadithDetailsPage({Key? key,required this.bookTitle, required this.bookColorCode, required this.chapterTitle, required this.chapterId, required this.bookId, required this.abvrCode,}) : super(key: key);

  @override
  State<HadithDetailsPage> createState() => _HadithDetailsPageState();
}

class _HadithDetailsPageState extends State<HadithDetailsPage> {


  @override
  void initState() {
    _loadInitialData();
    super.initState();
  }

  _loadInitialData () async{
    await Get.find<HadithDetailsController>().getHadithDetails(bookId: widget.bookId,chapterId: widget.chapterId);
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: HadithDetailsWidgets.appBar(
        bookName: widget.bookTitle,
        chapterTitle: widget.chapterTitle,
      ),
      body: GetBuilder<HadithDetailsController>(builder: (controller){
        return Container(
          padding: REdgeInsets.all(12.w),
          decoration: BoxDecoration(
              color: AppColors.bgColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius16), topRight: Radius.circular(Dimensions.radius16),)
          ),
          width: double.maxFinite,
          height: double.maxFinite,
          child: controller.isLoading ? Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),) :
          ListView.separated(
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) => Divider(color: AppColors.dividerColor, height: 20.h,),
              itemCount: controller.hadithSections.length,
              itemBuilder: (context, index){
              // var hadith = controller.hadithDetails.where((hadith) => hadith.sectionId == index+1).toList();
              var sectionInfo =  controller.hadithSections[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [


                      //Hadith Chapter
                      HadithDetailsWidgets.hadithChapter(
                          chapterNo: '${sectionInfo.number}',
                          chapterTitle: '${sectionInfo.number == sectionInfo.title ? '' : sectionInfo.title}',
                          description: '${sectionInfo.preface}'),

                      12.verticalSpace,

                      //Hadith Sector
                      ListView.separated(
                        separatorBuilder: (context, index) => 12.verticalSpace,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                          itemCount: controller.hadithDetails.where((hadith) => hadith.sectionId == sectionInfo.sectionId).toList().length,
                          itemBuilder: (context, index){
                          var hadithInfo = controller.hadithDetails.where((hadith) => hadith.sectionId == sectionInfo.sectionId).toList()[index];
                        return HadithDetailsWidgets.hadithSection(
                          bookColorCode: widget.bookColorCode,
                            hadithInfo: hadithInfo,
                          onTapOptions: ()=> HadithDetailsWidgets.bottomSheet(context),
                            abvrCode: widget.abvrCode,

                        );
                      })


                    ]);
              }),
        );
      })
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hadith_app/modules/hadith_chapters/hadith_chapters.dart';
import 'package:hadith_app/routes/app_pages.dart';
import 'package:hadith_app/utils/constants/constants.dart';
import 'package:hadith_app/utils/styles/dimensions.dart';

class HadithChaptersPage extends StatefulWidget {
  final int bookId;
  final String bookColorCode;
  final String abvrCode;
  final String bookTitle;
  const HadithChaptersPage({Key? key, required this.abvrCode, required this.bookColorCode, required this.bookId, required this.bookTitle}) : super(key: key);

  @override
  State<HadithChaptersPage> createState() => _HadithChaptersPageState();
}

class _HadithChaptersPageState extends State<HadithChaptersPage> {

  @override
  void initState() {
    _loadInitialData();
    super.initState();
  }

  _loadInitialData () async{
    await Get.find<HadithChaptersController>().getAllChapters(bookId: widget.bookId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
      appBar: HadithChaptersWidgets.appBar(title: widget.bookTitle),
      body: GetBuilder<HadithChaptersController>(builder: (controller){
        return Container(
          padding: REdgeInsets.all(12.w),
          decoration: BoxDecoration(
              color: AppColors.bgColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius16), topRight: Radius.circular(Dimensions.radius16),)
          ),
          width: double.maxFinite,
          height: double.maxFinite,
          child: controller.isLoading ? Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),) : ListView.separated(
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) => 10.verticalSpace,
            itemCount: controller.chapters.length,
            itemBuilder: (context, index){
              final chapterInfo = controller.chapters[index];
              return HadithChaptersWidgets.chapterCard(
                chapterInfo: chapterInfo,
                  onTap: () => Get.toNamed(AppPages.getHadithDetailsPage(
                      abvrCode: widget.abvrCode,
                      bookColorCode: widget.bookColorCode,
                      bookTitle: widget.bookTitle,bookId: chapterInfo.bookId, chapterTitle: chapterInfo.title, chapterId: chapterInfo.chapterId)));
            },),
        );
      })
    );
  }
}

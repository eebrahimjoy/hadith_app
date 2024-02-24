import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hadith_app/modules/custom_widgtes/custom_widgets.dart';
import 'package:hadith_app/modules/home/home.dart';
import 'package:hadith_app/routes/app_pages.dart';
import 'package:hadith_app/utils/constants/app_colors.dart';
import 'package:hadith_app/utils/styles/dimensions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    _loadInitialData();
    super.initState();
  }

  _loadInitialData () async{
    await Get.find<HomeController>().getAllBooks();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: AppColors.primaryColor,
      appBar: HomeWidgets.appBar(),
      body: GetBuilder<HomeController>(builder: (controller){
        return Container(
          padding: REdgeInsets.all(12.w),
          decoration: BoxDecoration(
              color: AppColors.bgColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius16), topRight: Radius.circular(Dimensions.radius16),)
          ),
          width: double.maxFinite,
          height: double.maxFinite,
          child: controller.isLoading ? Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),) :  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('সকল হাদিসের বই', style: TextStyles.mediumStyle(),),
              8.verticalSpace,
              Expanded(

                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (context, index) => 10.verticalSpace,
                      itemCount: controller.allBooks.length,
                      itemBuilder: (context, index){
                        final booksInfo = controller.allBooks[index];
                        return HomeWidgets.bookCard(
                          booksInfo: booksInfo,
                          onTap: () => Get.toNamed(AppPages.getHadithChaptersPage(
                              abvrCode: booksInfo.abvrCode,
                              bookColorCode: booksInfo.colorCode.substring(1),
                              bookId: booksInfo.id, bookTitle: booksInfo.title)));
                      })
              )
            ],
          ),
        );
      })
    );
  }
}

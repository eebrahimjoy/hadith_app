import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hadith_app/helper/initializer/initializer.dart';
import 'package:hadith_app/routes/app_pages.dart';
import 'package:hadith_app/utils/strings.dart';
import 'package:hadith_app/utils/styles/theme.dart';

void main() {
  Initializer.init(() async{
    runApp(const MyApp());
  });

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: Strings.appName,
          defaultTransition: Transition.cupertino,
          theme: ThemeConfig.lightTheme,
          initialRoute: AppPages.getHomePage(),
          getPages: AppPages.routes,
        );
      },
    );
  }
}

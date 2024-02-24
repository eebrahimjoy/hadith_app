import 'package:get/get.dart';
import 'package:hadith_app/modules/hadith_chapters/hadith_chapters.dart';
import 'package:hadith_app/modules/hadith_details/hadith_details.dart';
import '../modules/home/home.dart';

part 'app_routes.dart';

class AppPages {
  //Home Page
  static String getHomePage() => Routes.HOME;

  //Hadith Chapters Page
  static String getHadithChaptersPage({required String abvrCode, required String bookColorCode, required int bookId, required String bookTitle}) => '${Routes.HADITH_CHAPTERS}?abvrCode=$abvrCode&bookColorCode=$bookColorCode&bookId=$bookId&bookTitle=$bookTitle';

  //Hadith Details Page
  static String getHadithDetailsPage({required String abvrCode,required String bookColorCode,  required String bookTitle,required String chapterTitle,required int bookId, required int chapterId}) => '${Routes.HADITH_DETAILS}?abvrCode=$abvrCode&bookColorCode=$bookColorCode&bookTitle=$bookTitle&chapterTitle=$chapterTitle&bookId=$bookId&chapterId=$chapterId';

  static final routes = [
    //Home Page
    GetPage(
        name: Routes.HOME,
        page: () => const HomePage(),
        binding: HomeBinding()
    ),

    //Hadith Chapters Page
    GetPage(
        name: Routes.HADITH_CHAPTERS,
        page: () {
          var bookId = int.parse(Get.parameters['bookId']!);
          var bookTitle = Get.parameters['bookTitle']!;
          var bookColorCode = Get.parameters['bookColorCode']!;
          var abvrCode = Get.parameters['abvrCode']!;
          return  HadithChaptersPage(
            bookColorCode: bookColorCode,
            abvrCode: abvrCode,
            bookId: bookId,
            bookTitle: bookTitle,
          );
        },
        binding: HadithChaptersBinding()
    ),

    //Hadith Details Page
    GetPage(
        name: Routes.HADITH_DETAILS,
        page: () {
          var abvrCode = Get.parameters['abvrCode']!;
          var bookColorCode = Get.parameters['bookColorCode']!;
          var bookTitle = Get.parameters['bookTitle']!;
          var chapterTitle = Get.parameters['chapterTitle']!;
          var chapterId = int.parse(Get.parameters['chapterId']!);
          var bookId = int.parse(Get.parameters['bookId']!);
          return HadithDetailsPage(
              bookColorCode: bookColorCode,
            abvrCode: abvrCode,
              bookTitle: bookTitle,
            bookId: bookId,
            chapterTitle: chapterTitle,
            chapterId: chapterId);
        },
        binding: HadithDetailsBinding()
    ),

  ];
}

import 'package:get/get.dart';
import '../hadith_chapters.dart';

class HadithChaptersBinding extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut<HadithChaptersRepository>(() => HadithChaptersRepository(), fenix: true);
   Get.lazyPut<HadithChaptersController>(() => HadithChaptersController(hadithChaptersRepo: Get.find(), dbHelper: Get.find()), fenix: true);
  }

}
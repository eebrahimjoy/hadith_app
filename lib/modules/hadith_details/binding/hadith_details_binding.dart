import 'package:get/get.dart';
import '../hadith_details.dart';

class HadithDetailsBinding extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut<HadithDetailsRepository>(() => HadithDetailsRepository(), fenix: true);
   Get.lazyPut<HadithDetailsController>(() => HadithDetailsController(hadithDetailsRepo: Get.find(), dbHelper: Get.find()), fenix: true);
  }

}
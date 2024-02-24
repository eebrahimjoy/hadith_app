import 'package:get/get.dart';
import 'package:hadith_app/modules/home/home.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut<HomeRepository>(() => HomeRepository(), fenix: true);
   Get.lazyPut<HomeController>(() => HomeController(homeRepo: Get.find(), dbHelper: Get.find()), fenix: true);
  }

}
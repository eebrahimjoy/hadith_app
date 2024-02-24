import 'package:get/get.dart';
import 'package:hadith_app/helper/db_helper/db_helper.dart';
import 'package:hadith_app/models/hadith_chapters_model/hadith_chapters_model.dart';
import 'package:hadith_app/modules/hadith_chapters/hadith_chapters.dart';

class HadithChaptersController extends GetxController {
  final HadithChaptersRepository hadithChaptersRepo;
  final DBHelper dbHelper;

  HadithChaptersController({required this.hadithChaptersRepo, required this.dbHelper});

  List<HadithChapters> chapters = [];

  final _isLoading = false.obs;

  get isLoading => _isLoading.value;

  set isLoading (value){
    _isLoading.value = value;
  }

  Future<void> getAllChapters ({required int bookId}) async{
    chapters = [];
    isLoading= true;
    try {
      final database = await dbHelper.openDB();

      final List<Map<String, dynamic>> maps = await hadithChaptersRepo.getChapters(database, bookId: bookId);

      chapters = maps.map((e) => HadithChapters.fromJson(e)).toList();

      isLoading= false;
      update();
    } catch(e){
      isLoading= false;
      update();
      throw Exception(e.toString());
    }
  }
}
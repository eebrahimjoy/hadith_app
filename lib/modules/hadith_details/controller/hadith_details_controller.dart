import 'package:get/get.dart';
import 'package:hadith_app/helper/db_helper/db_helper.dart';
import 'package:hadith_app/models/hadith_details_model/hadith_details_model.dart';
import 'package:hadith_app/models/hadith_section_model/hadith_section_model.dart';
import 'package:hadith_app/modules/hadith_details/hadith_details.dart';

class HadithDetailsController extends GetxController {
    final HadithDetailsRepository hadithDetailsRepo;
    final DBHelper dbHelper;

    HadithDetailsController({required this.hadithDetailsRepo, required this.dbHelper});


    List<HadithDetails> hadithDetails = [];
    List<HadithSections> hadithSections = [];

    final _isLoading = false.obs;

    get isLoading => _isLoading.value;

    set isLoading (value){
      _isLoading.value = value;
    }

    Future<void> getHadithDetails ({required int chapterId, required int bookId}) async{
        hadithDetails = [];
        hadithSections = [];
      isLoading= true;
      try {
        final database = await dbHelper.openDB();

        final List<Map<String, dynamic>> hadith = await hadithDetailsRepo.getHadith(database, bookId: bookId, chapterId: chapterId);
        final List<Map<String, dynamic>> section = await hadithDetailsRepo.getSection(database, bookId: bookId, chapterId: chapterId);

        hadithDetails = hadith.map((e) => HadithDetails.fromJson(e)).toList();
        hadithSections = section.map((e) => HadithSections.fromJson(e)).toList();

        isLoading= false;
        update();
      } catch(e){
        isLoading= false;
        update();
        throw Exception(e.toString());
      }
    }
}
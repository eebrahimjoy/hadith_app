import 'package:get/get.dart';
import 'package:hadith_app/helper/db_helper/db_helper.dart';
import 'package:hadith_app/models/hadith_books_model/hadith_books_model.dart';
import 'package:hadith_app/modules/home/home.dart';

class HomeController extends GetxController {
  final HomeRepository homeRepo;
  final DBHelper dbHelper;

  HomeController({required this.homeRepo, required this.dbHelper});

  List<HadithBooks> allBooks = [];

  final _isLoading = false.obs;

  get isLoading => _isLoading.value;

  set isLoading (value){
    _isLoading.value = value;
  }

  Future<void> getAllBooks () async{
    allBooks = [];
    isLoading= true;
    try {
      final database = await dbHelper.openDB();

      final List<Map<String, dynamic>> maps = await homeRepo.getAllBooks(database);

      allBooks = maps.map((e) => HadithBooks.fromJson(e)).toList();

      isLoading= false;
      update();
    } catch(e){
      isLoading= false;
      update();
      throw Exception(e.toString());
    }
  }
}
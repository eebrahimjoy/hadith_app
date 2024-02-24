import 'package:sqflite/sqflite.dart';

class HadithDetailsRepository {
   getHadith (Database? db, {required int bookId,required int chapterId})async{
    final List<Map<String, dynamic>> hadith = await db!.query(
      'hadith',
      where: 'book_id = ? AND chapter_id = ?',
      whereArgs: [bookId, chapterId],
    );

    return hadith;
  }

   getSection (Database? db, {required int bookId, required int chapterId})async{
     final List<Map<String, dynamic>> hadith = await db!.query(
       'section',
       where: 'book_id = ? AND chapter_id = ?',
       whereArgs: [bookId, chapterId],
     );

     return hadith;
   }
}
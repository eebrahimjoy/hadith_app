import 'package:sqflite/sqflite.dart';

class HadithChaptersRepository {
   getChapters (Database? db, {required int bookId})async{
    final List<Map<String, dynamic>> chapters = await db!.query(
      'chapter',
      where: 'book_id = ?',
      whereArgs: [bookId],
    );

    return chapters;
  }
}
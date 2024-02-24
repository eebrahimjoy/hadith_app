import 'package:sqflite/sqflite.dart';

class HomeRepository {
   getAllBooks (Database? db)async{
    final List<Map<String, dynamic>> allBooks = await db!.query('books');

    return allBooks;
  }
}
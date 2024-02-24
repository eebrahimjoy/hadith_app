import 'dart:io';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {

   Future<Database?> openDB () async{
    final dbPath = await getDatabasesPath();

    final path =  join(dbPath, 'hadith_bn_test.db');

    final exist = await databaseExists(path);


    if(!exist){
      //database doesn't exists - creating new one

      try {
        await Directory(dirname(path)).create(recursive: true);

      } catch (e){
        throw Exception(e.toString());
      }


      ByteData data = await rootBundle.load(join('assets', 'db', 'hadith_bn_test.db'));


      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(path).writeAsBytes(bytes, flush: true);

    }
    return await openDatabase(path);

  }

}
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../modules/custom_widgtes/custom_widgets.dart';
import '../db_helper/db_helper.dart';

abstract class Initializer {
  static void init(VoidCallback runApp) {
    ErrorWidget.builder = (errorDetails) {
      return CustomErrorWidget(message: errorDetails.exceptionAsString(),
      );
    };

    runZonedGuarded(() async {
     WidgetsFlutterBinding.ensureInitialized();
      FlutterError.onError = (details) {
        FlutterError.dumpErrorToConsole(details);
        Get.printInfo(info: details.stack.toString());
      };

      await _initServices();
      runApp();
    }, (error, stack) {
      Get.printInfo(info: 'runZonedGuarded: ${error.toString()}');
    });
  }

  static Future<void> _initServices() async {
    try {

      await _initDB();

      _initScreenPreference();
    } catch (err) {
      rethrow;
    }
  }

  static Future<void> _initDB() async {
    final DBHelper dbHelper = DBHelper();
    Get.lazyPut(() => dbHelper, fenix: true);
  }

  static void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}

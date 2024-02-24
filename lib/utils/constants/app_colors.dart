import 'package:flutter/material.dart';

class AppColors {
  static Color whiteColor = Colors.white;
  static Color bgColor = hexToColor('#F4F4F4');
  static Color lightScaffoldBackgroundColor = Colors.white;
  static Color darkScaffoldBackgroundColor = hexToColor('#2F2E2E');
  static Color secondaryAppColor = hexToColor('#1AA483');
  static Color secondaryDarkAppColor = Colors.white;
  static Color primaryColor = hexToColor('#1AA483');
  static Color primaryColorLight = primaryColor.withOpacity(0.3);
  static Color baseColor = hexToColor('#1B1E23');
  static Color greyColor = hexToColor('#CECECE');
  static Color greyColorLight = hexToColor('#E7E7E7');

  //Divider
  static Color dividerColor = hexToColor('#E7E7E7');


  //Font
  static Color baseFontColor = hexToColor('#1B1E23');
  static Color lightFontColor = hexToColor('#4E5054');


  //Shadow
  static Color shadowColor = baseColor.withOpacity(0.05);

}



Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}

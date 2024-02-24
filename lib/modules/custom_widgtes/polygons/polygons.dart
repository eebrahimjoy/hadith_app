import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hadith_app/utils/constants/constants.dart';
import 'package:hadith_app/utils/styles/dimensions.dart';

class Polygons {
  static Widget hexagon ({double? size, double? radius, Widget? child}){

    return SizedBox(
      height: size ?? 50.w,
      width: size ?? 50.w,
      child: ClipPolygon(
        sides: 6,
        borderRadius: radius ?? Dimensions.radius10,
        boxShadows: [
          PolygonBoxShadow(color: AppColors.shadowColor, elevation: 5.0),
        ],
        child: child,
      ),
    );
  }
}
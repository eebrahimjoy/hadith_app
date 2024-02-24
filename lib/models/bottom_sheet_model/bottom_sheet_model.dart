

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetItems {
  String name;
  IconData? icon;

  BottomSheetItems({required this.name, required this.icon});


  static List<BottomSheetItems> items = [
    BottomSheetItems(name: 'Go To Main Hadith', icon: CupertinoIcons.paperplane ),
    BottomSheetItems(name: 'Add to Collection', icon: CupertinoIcons.bookmark ),
    BottomSheetItems(name: 'Bangla Copy', icon: Icons.copy ),
    BottomSheetItems(name: 'English Copy', icon: Icons.copy ),
    BottomSheetItems(name: 'Arabic Copy', icon: Icons.copy ),
    BottomSheetItems(name: 'Add Hifz', icon: CupertinoIcons.add_circled_solid ),
    BottomSheetItems(name: 'Add Note', icon: CupertinoIcons.add_circled_solid ),
    BottomSheetItems(name: 'Share', icon: Icons.share ),
    BottomSheetItems(name: 'Report', icon: Icons.report ),
  ];
}
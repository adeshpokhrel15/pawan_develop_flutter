import 'package:flutter/material.dart';
import 'package:mechanic_baato/src/utils/managers/color_manager.dart';

class BaatoTextSelectionTheme {
  BaatoTextSelectionTheme._();

  static const TextSelectionThemeData lightTextSelectionTheme =
      TextSelectionThemeData(
    cursorColor: ThemeColor.primary,
    selectionColor: ThemeColor.black,
    selectionHandleColor: ThemeColor.accent,
  );
}

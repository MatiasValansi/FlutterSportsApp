import 'package:flutter/material.dart';

final List<Color> colorOptions = [
  Colors.blue,
  Colors.pink,
  Colors.green,
  Colors.amber,
  Colors.purple,
  Colors.cyan,
  Colors.teal,
  Colors.indigo
];

class AppTheme {

  final int selectedColor;
  final bool isDarkMode;

  AppTheme({
    this.selectedColor = 0,
    this.isDarkMode = false,
  });

  ThemeData getTheme(){

    return ThemeData(
      colorSchemeSeed: colorOptions[this.selectedColor],
      brightness: this.isDarkMode ? Brightness.dark : Brightness.light,
    );    
  }

  AppTheme copyWith({
    int? selectedColor,
    bool? isDarkMode,
  }){

    return AppTheme(
      selectedColor: selectedColor ?? this.selectedColor,
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }
}
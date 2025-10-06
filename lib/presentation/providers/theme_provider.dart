
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:intro_riverpod_notificaciones_pagerview/core/theme/app_theme.dart';

StateProvider<int> selectedColorProvider = StateProvider<int>((ref) {
  return 0;
});

final themeProvider = StateNotifierProvider<ThemeNotifier, AppTheme>((ref){
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier():super(AppTheme());

  void selectColor(int color){
    state = state.copyWith(selectedColor: color);
  }

  void toggleDarkMode(bool isDarkMode){
    state = state.copyWith(isDarkMode: isDarkMode);
  }
  
}
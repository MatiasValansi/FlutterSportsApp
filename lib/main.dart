import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intro_riverpod_notificaciones_pagerview/core/router/app_router.dart';
import 'package:intro_riverpod_notificaciones_pagerview/core/theme/app_theme.dart';
import 'package:intro_riverpod_notificaciones_pagerview/presentation/providers/theme_provider.dart';

void main() {
  runApp(ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  MainApp({super.key});

  //final appTheme = AppTheme(selectedColor: 6, isDarkMode: true);

  @override
  Widget build(BuildContext context, ref) {
    final appTheme = ref.watch(themeProvider);
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: appTheme.getTheme()
    );
  }
}

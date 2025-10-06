import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intro_riverpod_notificaciones_pagerview/core/theme/app_theme.dart';
import 'package:intro_riverpod_notificaciones_pagerview/presentation/providers/theme_provider.dart';

class ThemeSelector extends StatelessWidget{
  ThemeSelector({super.key});

  final colorList = colorOptions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seleccionar Tema'),
      ),
      body: _SelectorView(colorList: colorList),
    );
  }
}

class _SelectorView extends ConsumerWidget{
  
  final List<Color> colorList;

  _SelectorView({
    super.key,
    this.colorList = const [],
  });

  @override
  Widget build(BuildContext context, ref) {

    int selectedColor = ref.watch(selectedColorProvider);

    return ListView.builder(itemCount: colorList.length, itemBuilder: (context, index){

      return RadioListTile(
        title: Text('Color $index', style: TextStyle(color: colorList[index]),),
        value: index, groupValue: selectedColor, onChanged: (value){
        ref.read(themeProvider.notifier).selectColor(value!); //Para que cambie el estado del color en tiempo real
        ref.read(selectedColorProvider.notifier).state = value;
        
      },);
    });
  }
  
}
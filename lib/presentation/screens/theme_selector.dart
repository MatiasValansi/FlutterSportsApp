import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThemeSelector extends StatelessWidget{
  const ThemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _SelectorView extends StatelessWidget{
  
  final List<Color> colorList;
  int selectedColor = 0;

  _SelectorView({
    super.key,
    this.colorList = const [],
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: colorList.length, itemBuilder: (context, index){

      return RadioListTile(value: index, groupValue: selectedColor, onChanged: (value){
        selectedColor = value!;
      },);
    });
  }
  
}
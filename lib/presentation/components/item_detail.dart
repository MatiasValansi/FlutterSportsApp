import 'package:flutter/material.dart';

class ItemDetail extends StatelessWidget{

  String title;
  String subtitle;
  String description;
  String imageUrl;

    ItemDetail({
      super.key,
      required this.title,
      required this.subtitle,
      required this.description,
      required this.imageUrl
    });

    String getTitle() => title;
    String getSubtitle() => subtitle;
    String getDescription() => description;
    String getImageUrl() => imageUrl;

    @override
  Widget build(BuildContext context) {
    
    final textStyle = Theme.of(context).textTheme;
    
    return Center(
      child: Column(
      
      mainAxisAlignment: MainAxisAlignment.center,

      
      children: [
        imageUrl.isNotEmpty ? Image.network(imageUrl) : const Icon(Icons.person, size: 50,), //Validación por si no carga la imagen
        //Image.network(imageUrl),
        Text(title, style: textStyle.titleLarge,),
        Text(subtitle, style: textStyle.titleMedium),
        Text(description, style: textStyle.bodyMedium, textAlign: TextAlign.center,)
      ],
    ),
    ); 
  }
}
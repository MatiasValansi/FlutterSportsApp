import 'package:flutter/material.dart';
import 'package:intro_riverpod_notificaciones_pagerview/domain/player.dart';
import 'package:intro_riverpod_notificaciones_pagerview/presentation/components/item_detail.dart';
import 'package:intro_riverpod_notificaciones_pagerview/presentation/components/slide_info.dart';

/**
 Este widget mostrará el Slide.
 */

// ignore: must_be_immutable
class Pager extends StatelessWidget {
  Player playerToDetail;

  Pager({
    super.key,
    required this.playerToDetail
  });

  @override
  Widget build(BuildContext context) {
    return PageView(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 184, 180, 180),
            ),
            child: Image.network(playerToDetail.playerImageUrl),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 4, 196, 255),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(playerToDetail.name),
                Text(playerToDetail.sport),
                Text(playerToDetail.country),
              ],
            ),
          ),            
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 255, 245, 101),
            ),
            child: ItemDetail(
              title: playerToDetail.name,
              subtitle: playerToDetail.sport,
              description: playerToDetail.country,
              imageUrl: playerToDetail.playerImageUrl,
            ),
          ),
        ],
    );
  }
}

class _SlideView extends StatelessWidget {
  const _SlideView({
    super.key,
    required this.slide,
  });

  final SlideInfo slide;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(slide.image),
        Text(slide.title, style: Theme.of(context).textTheme.titleLarge),
        Padding(padding:  const EdgeInsets.all(20), child: Text(slide.title, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center,),)
      ],
    );
  }
}
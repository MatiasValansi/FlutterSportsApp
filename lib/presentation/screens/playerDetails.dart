import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intro_riverpod_notificaciones_pagerview/domain/player.dart';
import 'package:intro_riverpod_notificaciones_pagerview/presentation/components/item_detail.dart';
import 'package:intro_riverpod_notificaciones_pagerview/presentation/components/slide_info.dart';
import 'package:intro_riverpod_notificaciones_pagerview/presentation/providers/list_players_provider.dart';
import 'package:intro_riverpod_notificaciones_pagerview/presentation/screens/pager.dart';

class PlayerDetails extends ConsumerWidget {
  final Player playerToDetail;

  void openDialog(BuildContext context, WidgetRef ref) {
    // Lógica para abrir el diálogo
    showDialog(barrierDismissible: false, context: context, builder: (context) => AlertDialog(
      icon: const Icon(Icons.warning, color: Colors.red,),
      title: const Text("Eliminar jugador"),
      content: Text("¿Estás seguro de que deseas eliminar a ${playerToDetail.name}|?"),
      actions: [
        TextButton(onPressed: () {
          context.pop();
        }, child: const Text("Cancelar")),
        ElevatedButton(onPressed: () {
          //Si presiona aceptar, eliminar el jugador y cerrar el diálogo    

          ref.read(listPlayersProvider.notifier).state = ref
          .read(listPlayersProvider)
          .where((player) => player.id != playerToDetail.id)
          .toList(); //Elimina jugador
          context.pop();//Cierra el diálogo      
          Navigator.pop(context);//Vuelve a la pantalla anterior
        }, child: const Text("Aceptar"))
      ],
    ));
    }

  const PlayerDetails(
    {
    super.key, 
    required this.playerToDetail
    }
    );

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        title: Text(playerToDetail.name),
      ),
      body: Column(
        children: [
          Expanded(child: Pager(playerToDetail: playerToDetail)),
          ElevatedButton.icon(onPressed: () {          
           
            openDialog(context, ref);           

            
          }, label: const Text("Borrar ❌"), icon: const Icon(Icons.delete)),
          const SizedBox(height: 20),          
        ],
      ),
    );
  }

}
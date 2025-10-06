import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intro_riverpod_notificaciones_pagerview/data/player_repository.dart';
import 'package:intro_riverpod_notificaciones_pagerview/domain/player.dart';
import 'package:intro_riverpod_notificaciones_pagerview/presentation/providers/list_players_provider.dart';

class CreatePlayer extends ConsumerWidget {
  CreatePlayer({super.key});
  final TextEditingController _namePlayerToCreate = TextEditingController();
  final TextEditingController _sportPlayerToCreate = TextEditingController();
  final TextEditingController _countryPlayerToCreate = TextEditingController();
  final TextEditingController _imagePlayerToCreate = TextEditingController();
  
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Player> players = ref.watch(listPlayersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Player'),
      ),
      body: Wrap(
        children: [
          Container(
            child: TextField(
              controller: _namePlayerToCreate,
              decoration: const InputDecoration(labelText: "Nombre"),
            ),
          ),
          TextField(
            controller: _sportPlayerToCreate,
            decoration: const InputDecoration(labelText: "Deporte"),
          ),
          TextField(
            controller: _countryPlayerToCreate,
            decoration: const InputDecoration(labelText: "País"),
          ),
          TextField(
            controller: _imagePlayerToCreate,
            decoration: const InputDecoration(labelText: "Imagen (URL)"),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Lógica para crear el jugador
              Player newPlayer = Player(
                id: players.length + 1, // Generar un ID único
                name: _namePlayerToCreate.text,
                sport: _sportPlayerToCreate.text,
                country: _countryPlayerToCreate.text,
                playerImageUrl: _imagePlayerToCreate.text,
              );
              print(newPlayer.name);
              print(players.length);
              // Aquí podrías agregar el jugador a una lista o base de datos
              //playerRepository.addPlayer(newPlayer); //Ver si con el Gestor de Estados se puede guardar el la lista original.
              ref.read(listPlayersProvider.notifier).state = [...players, newPlayer];
              
              // Luego, navega de regreso a la pantalla anterior
              Navigator.pop(context);
            }, child: const Text('Guardar 💾'),
          ),
                 ],
      )
    );
  }
}

/**
 class _CreatePlayerState extends State<CreatePlayer> {
  final TextEditingController _namePlayerToCreate = TextEditingController();
  final TextEditingController _numberPlayerToCreate = TextEditingController();
  final TextEditingController _teamPlayerToCreate = TextEditingController();
  final TextEditingController _positionPlayerToCreate = TextEditingController();
  final TextEditingController _imagePlayerToCreate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final playerRepository = PlayerRepository();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Player'),
      ),
      body: Wrap(
        children: [
          Container(
            child: TextField(
              controller: _namePlayerToCreate,
              decoration: const InputDecoration(labelText: "Nombre"),
            ),
          ),
          TextField(
            controller: _numberPlayerToCreate,
            decoration: const InputDecoration(labelText: "Número"),
          ),
          TextField(
            controller: _teamPlayerToCreate,
            decoration: const InputDecoration(labelText: "Equipo"),
          ),
          TextField(
            controller: _positionPlayerToCreate,
            decoration: const InputDecoration(labelText: "Posición"),
          ),
          TextField(
            controller: _imagePlayerToCreate,
            decoration: const InputDecoration(labelText: "Imagen (URL)"),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Lógica para crear el jugador
              Player newPlayer = Player(
                id: playerRepository.getPlayers().length + 1, // Generar un ID único
                name: _namePlayerToCreate.text,
                shirtNumber: _numberPlayerToCreate.text,
                teamName: _teamPlayerToCreate.text,
                position: _positionPlayerToCreate.text,
                playerImageUrl: _imagePlayerToCreate.text,
              );
              
              // Aquí podrías agregar el jugador a una lista o base de datos
              playerRepository.addPlayer(newPlayer); //Ver si con el Gestor de Estados se puede guardar el la lista original.

              
              // Luego, navega de regreso a la pantalla anterior
              Navigator.pop(context);
            }, child: const Text('Guardar 💾'),
          ),
                 ],
      )
    );
  }
}
  
 */

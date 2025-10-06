//Será el encargado de mostrar la lista de items

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intro_riverpod_notificaciones_pagerview/data/player_repository.dart';
import 'package:intro_riverpod_notificaciones_pagerview/domain/player.dart';
import 'package:intro_riverpod_notificaciones_pagerview/presentation/components/drawer_menu.dart';
import 'package:intro_riverpod_notificaciones_pagerview/presentation/providers/list_players_provider.dart';

class Home extends ConsumerWidget {
  
  const Home({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    //List<Player> players = ref.watch(listPlayersProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: 
      _PlayersList(players: ref.watch(listPlayersProvider)),
      drawer: const DrawerMenu(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/create-player');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _HomeState extends State<Home> {
  
  final playerRepository = PlayerRepository();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: 
      _PlayersList(players: playerRepository.getPlayers()),
      drawer: const DrawerMenu(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/create-player');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _PlayersList extends StatelessWidget {
  
  final List<Player> players;
  
  const _PlayersList({
    super.key,
    required this.players
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.players.length,
      itemBuilder: (context, index) {
        return _PlayerItem(playerToShow: this.players[index],);
      },
    );
  }
}

class _PlayerItem extends StatelessWidget {
  
  final Player playerToShow;
  
  const _PlayerItem({
    super.key,
    required this.playerToShow
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
      title: Text(playerToShow.name),
      subtitle: Text(playerToShow.sport),
      //leading: Image.network(playerToShow.playerImageUrl),
      
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: playerToShow.playerImageUrl.isNotEmpty
        ? Image.network(playerToShow.playerImageUrl)
        :const Icon(Icons.person, size: 50,),
      ),
      
      trailing: const Icon(Icons.arrow_circle_right),
      onTap: () {
        context.push('/player',extra: this.playerToShow);
      },
    ),
    ) ;
  }
}
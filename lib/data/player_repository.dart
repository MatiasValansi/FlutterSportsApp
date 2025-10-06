
import 'package:intro_riverpod_notificaciones_pagerview/domain/player.dart';

class PlayerRepository {
// Implementar un Provider de la lista de deportistas para manejarlo globalemente.

  // ignore: non_constant_identifier_names
  final List<Player> _players = [
    Player(id: 1, name: 'Lionel Messi', sport: 'Futbol', country: 'Argentina',playerImageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/Lionel_Messi_NE_Revolution_Inter_Miami_7.9.25-055.jpg/250px-Lionel_Messi_NE_Revolution_Inter_Miami_7.9.25-055.jpg'),
    
    Player(id: 2, name: 'Michael Jordan', sport: 'Basket', country: 'Estados Unidos',playerImageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Michael_Jordan_in_2014.jpg/250px-Michael_Jordan_in_2014.jpg'),

  ];

  List<Player> getPlayers(){
    return _players;
  }

  void addPlayer(Player newPlayer){
    _players.add(newPlayer);
  }  
}
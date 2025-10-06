
import 'package:flutter_riverpod/legacy.dart';
import 'package:intro_riverpod_notificaciones_pagerview/data/player_repository.dart';
import 'package:intro_riverpod_notificaciones_pagerview/domain/player.dart';

StateProvider<List<Player>> listPlayersProvider = StateProvider<List<Player>>((ref) {
  PlayerRepository playersProvider = PlayerRepository();
  return playersProvider.getPlayers();
});
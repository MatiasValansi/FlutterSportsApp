import 'package:go_router/go_router.dart';
import 'package:intro_riverpod_notificaciones_pagerview/domain/player.dart';
import 'package:intro_riverpod_notificaciones_pagerview/presentation/screens/createPlayer.dart';
import 'package:intro_riverpod_notificaciones_pagerview/presentation/screens/home.dart';
import 'package:intro_riverpod_notificaciones_pagerview/presentation/screens/playerDetails.dart';
import 'package:intro_riverpod_notificaciones_pagerview/presentation/screens/logIn.dart';
import 'package:intro_riverpod_notificaciones_pagerview/presentation/screens/settings.dart';
import 'package:intro_riverpod_notificaciones_pagerview/presentation/screens/theme_selector.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => Login()  
    ),
    GoRoute(path: '/list',
    builder: (context, state) => Home(),
    ),
    GoRoute(path: '/player',
    builder: (context, state) => PlayerDetails(playerToDetail: state.extra as Player,),
    ),
    GoRoute(path: '/settings',
    builder: (context, state) => Settings(),
    ),
    GoRoute(path: '/create-player',
    builder: (context, state) => CreatePlayer(),
    ),
    GoRoute(path: '/theme-selector',
    builder: (context, state) => ThemeSelector(),)
  ]
);
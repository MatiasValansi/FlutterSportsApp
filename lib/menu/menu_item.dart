import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final String link;

  MenuItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.link,
  });
}

List<MenuItem> menuItems = [
  MenuItem(
    title: 'Ajustes 🛠️',
    subtitle: 'Go to home screen',
    icon: Icons.settings,
    link: '/settings',
  ),
  MenuItem(title: 'Tema', subtitle: 'Seleccionar tema', icon: Icons.twenty_three_mp_rounded, link: '/theme-selector'),
  MenuItem(
    title: 'Cerrar sesión',
    subtitle: 'View your profile',
    icon: Icons.logout,
    link: '/login',
  )
];
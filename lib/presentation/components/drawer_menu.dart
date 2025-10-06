import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intro_riverpod_notificaciones_pagerview/menu/menu_item.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      onDestinationSelected: (index) {
        setState(() {
          selectedItem = index; // Para que la opción quede seleccionada
        });

        context.push(menuItems[index].link);
      },
      selectedIndex: selectedItem,
      children: [
        
        DrawerHeader(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          child: Column(
            children: const [
              CircleAvatar(
                radius: 48,
                backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/36420573?v=4'),
              ),
              SizedBox(height: 8,),
              Text('Matías Valansi'),
            ],
          ),
        ),

        ...menuItems.map(
          (item) => NavigationDrawerDestination(
            icon: Icon(item.icon),
            label: Text(item.title),
          ),
        )
      ],
    );
  }
}
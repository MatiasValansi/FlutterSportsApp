import 'package:flutter/material.dart';

enum Transportation { espanol, ingles, frances, aleman, italiano }

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: [
          const Text('Selecciona tu idioma preferido:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ElevatedButton(onPressed: (){}, child: 
          const Text('Idioma seleccionado: Español', style: TextStyle(fontSize: 16))),

          FilledButton(onPressed: (){}, child: const Text('Guardar cambios', style: TextStyle(fontSize: 16))),

          TextButton.icon(onPressed: (){}, label: const Text('Restablecer ajustes', style: TextStyle(fontSize: 16))),

          IconButton(onPressed: (){}, icon: const Icon(Icons.delete)),
          
        ])
    );

  }
}



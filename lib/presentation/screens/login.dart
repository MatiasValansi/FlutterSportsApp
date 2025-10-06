import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intro_riverpod_notificaciones_pagerview/domain/user.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController  =TextEditingController();

  String inputText = 'LOG IN - Ingresá tus credenciales';
  List<User> users = [
    User(username: 'Mati',email: 'probandoflutter@gmail.com', password: 'flutter123')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen')
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [
             Text(inputText,
            style: TextStyle(fontSize: 24),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: "Contraseña"),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {
              
              //bool _userExists = users.any((eachUser) => eachUser.email == _emailController.text && eachUser.password == _passwordController.text);
            User? _usuario = users.firstWhere(
                (eachUser) => eachUser.email == _emailController.text && eachUser.password == _passwordController.text,
                orElse: () => User(username: '', email: '', password: ''), // valor por defecto
              );
              if (_usuario.email.isNotEmpty) {
                inputText = _usuario.username;              
                context.go('/list', extra: inputText);  
              } else {
                inputText = 'Email o Contraseña Incorrectas';
                setState(() {
                  
                });
              }
                            
            }, child: const Text('Log In'))
          ],
        )
      )
      );
  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(title: 'GS3', home: Homepage()));
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF3C6AB2), Color(0xFFFFFFFF)],
              stops: [0.0, 0.4512]),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              color: Colors.white,
              icon: const Icon(Icons.menu),
              tooltip: 'Menu de navegação',
              onPressed: () {},
            ),
            title: const Text(
              'Olá, cliente!',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              IconButton(
                color: Colors.white,
                icon: const Icon(Icons.chat_bubble_outline),
                tooltip: 'Mensagens',
                onPressed: () {},
              ),
              IconButton(
                color: Colors.white,
                icon: const Icon(Icons.notifications_outlined),
                tooltip: 'Notificações',
                onPressed: () {},
              ),
            ],
          ),
          // body is the majority of the screen.
          body: Container(),
        ));
  }
}

import 'package:flutter/material.dart';

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
              stops: [0.0, 0.4512])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(2.0),
            child: Container(
                color: const Color.fromRGBO(229, 229, 229, 0.7),
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                height: 1.0),
          ),
          backgroundColor: Colors.transparent,
          leading: IconButton(
              color: Colors.white, icon: const Icon(Icons.menu), tooltip: 'Menu de navegação', onPressed: () {}),
          title: RichText(
            text: const TextSpan(
              style: TextStyle(fontSize: 17.0, color: Colors.white),
              children: [
                TextSpan(text: 'Olá,'),
                TextSpan(
                  text: 'Cliente',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
                color: Colors.white,
                icon: const Icon(Icons.chat_bubble_outline),
                tooltip: 'Mensagens',
                onPressed: () {}),
            IconButton(
                color: Colors.white,
                icon: const Icon(Icons.notifications_outlined),
                tooltip: 'Notificações',
                onPressed: () {}),
          ],
        ),
        body: Container(),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Pantallalista extends StatefulWidget {
  const Pantallalista({super.key});

  @override
  State<Pantallalista> createState() => _PantallalistaState();
}

class _PantallalistaState extends State<Pantallalista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(child: Text("Mi app de tareas")),
      ),
      // ... tu AppBar transparente arriba
      body: Container(
        // <- 1. El Container rojo va por fuera
        width: double.infinity,
        height: double
            .infinity, // (Opcional) Para asegurar que cubra toda la pantalla hacia abajo
        decoration: BoxDecoration(color: Colors.red),
        child: SafeArea(
          // <- 2. El SafeArea va por dentro
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Titulo"),
                    Text("Descripcion"),
                    Text("Estado"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

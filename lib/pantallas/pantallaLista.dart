import 'package:flutter/material.dart';

class Pantallalista extends StatefulWidget {
  const Pantallalista({super.key});

  @override
  State<Pantallalista> createState() => _PantallalistaState();
}

class _PantallalistaState extends State<Pantallalista> {
  // Solución: Usar una List<Map<String, dynamic>> para representar una lista de tareas.
  final List<Map<String, dynamic>> tareas = [
    {
      "Indice": 1,
      "Titulo": "Limpiar la casa",
      "Descripcion": "Descripcion de la tarea 1",
      "Estado": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Hace que la app bar sea transparente
      //extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 0,
        title: Center(
          child: Text(
            "Mi app de tareas",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      // ... tu AppBar transparente arriba
      body: Container(
        // <- 1. El Container rojo va por fuera
        width: double.infinity,
        height: double.infinity, // (Opcional) Para asegurar
        decoration: BoxDecoration(color: Colors.white),
        child: SafeArea(
          // <- 2. El SafeArea va por dentro
          child: Column(
            children: [
              Expanded(
                child: tareas.isEmpty
                    ? Center(child: Text("No hay tareas"))
                    : ListView.builder(
                        // shrinkWrap: la lista solo ocupa el alto de sus hijos, no toda la pantalla
                        shrinkWrap: true,
                        itemCount: tareas.length,
                        itemBuilder: (context, index) {
                          return Container(
                            // El blanco va en CADA ítem, no en toda la lista
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.2),
                            ),
                            child: ListTile(
                              leading: Text(tareas[index]["Indice"].toString()),
                              title: Text(tareas[index]["Titulo"]),
                              subtitle: Text(tareas[index]["Descripcion"]),
                              trailing: Checkbox(
                                value: tareas[index]["Estado"],
                                onChanged: (value) {
                                  setState(() {
                                    tareas[index]["Estado"] = value;
                                  });
                                },
                              ),
                            ),
                          );
                        },
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Aquí puedes agregar la lógica para añadir una nueva tarea
                    },
                    child: Text("Agregar tarea"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

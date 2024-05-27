import 'package:flutter/material.dart';
import 'package:prueba_examen/boton.dart';

class Diagnostico extends StatelessWidget {
  const Diagnostico({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diagnóstico de Acupuntura'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.0),
            MyButton(text: "Crear nueva ficha", onTap: () {
              Navigator.pushNamed(context, "/menupage");
            },),
            SizedBox(height: 50.0),
            MyButton(text: "Cargar ficha", onTap: () {
              Navigator.pushNamed(context, "/menupage");
            },),
            SizedBox(height: 300.0),
            // Fila de botones inferiores
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildIconButton(context, Icons.folder, "Fichas"),
                _buildIconButton(context, Icons.search, "Biblioteca"),
                _buildIconButton(context, Icons.notifications, "Puntología"),
                _buildIconButton(context, Icons.person, "Perfil"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
Widget _buildIconButton(BuildContext context, IconData iconData, String subtitle) {
  return Column(
    children: [
      IconButton(
        icon: Icon(iconData),
        onPressed: () {
          Navigator.pushNamed(context, "/fichasguardadas");
        },
      ),
      SizedBox(height: 5),
      Text(
        subtitle,
        style: TextStyle(fontSize: 12),
      ),
    ],
  );
}

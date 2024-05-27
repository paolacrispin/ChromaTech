import 'package:flutter/material.dart';
import 'package:prueba_examen/boton.dart';

class CrearCuenta extends StatelessWidget {
  const CrearCuenta({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Nueva Cuenta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Correo electrónico',
              ),
            ),
            SizedBox(height: 30.0),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Contraseña',
              ),
            ),
            SizedBox(height: 30.0),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Repetir contraseña',
              ),
            ),
            SizedBox(height: 250.0),
            MyButton(text: "Crear Cuenta", onTap: () {
              Navigator.pushNamed(context, "/menupage");
            },)
          ],
        ),
      ),
    );
  }
}

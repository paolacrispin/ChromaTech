import 'package:flutter/material.dart';
import 'package:prueba_examen/boton.dart';

class IniciarSesion extends StatelessWidget {
  const IniciarSesion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar Sesión'),
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
            //FALTA OLVIDASTE CONTRASEÑAAA
            //FALTA RECUPERAR CONTRASEÑAAA

            SizedBox(height: 250.0),
            MyButton(text: "Iniciar Sesión", onTap: () {
              Navigator.pushNamed(context, "/diagnostico");
            },)
          ],
        ),
      ),
    );
  }
}

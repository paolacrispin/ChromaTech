import 'package:flutter/material.dart';
import 'package:prueba_examen/boton.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(25.8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            const SizedBox(height: 25),
            Text("Diagnóstico de Acupuntura", style: TextStyle(fontSize: 26),),
            //icon
            const SizedBox(height: 40),
//WIDGET DE IMGAEEEEE
            Placeholder(
              fallbackHeight: 200,
              fallbackWidth: double.infinity,
            ),
            const SizedBox(height: 40),

            MyButton(text: "Inicia Sesión con Facebook", onTap: () {
              Navigator.pushNamed(context, "/menupage");
            },),
            const SizedBox(height: 25),

            MyButton(text: "Crear cuenta con E-mail", onTap: () {
              Navigator.pushNamed(context, "/crearcuenta");
            },),
            const SizedBox(height: 25),

            //get started button
            MyButton(text: "Iniciar Sesión", onTap: () {
              Navigator.pushNamed(context, "/iniciarsesion");
            },)
          ],
        ),
      ),
    );
  }
}

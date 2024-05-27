import 'package:flutter/material.dart';
import 'package:prueba_examen/iniciar_sesion.dart';
import 'package:prueba_examen/crear_nueva_cuenta.dart';
import 'package:prueba_examen/diagnostico.dart';
import 'package:prueba_examen/intro_page.dart';
import 'package:prueba_examen/fichas_guardadas.dart';


void main(){
  runApp(const MyApp() );
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      routes:{
        '/intropage': (context)=> const IntroPage(),
        '/crearcuenta': (context)=> const CrearCuenta(),
        '/iniciarsesion': (context)=> const IniciarSesion(),
        '/diagnostico': (context)=> const Diagnostico(),
        '/fichasguardadas': (context)=> const FichasGuardadas(),

      },
    );
  }
}


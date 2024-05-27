import 'package:flutter/material.dart';
import 'welcome.dart';
import 'login_screen.dart'; // Asegúrate de importar tu pantalla LoginScreen
import 'home_page.dart'; // Asegúrate de importar tu pantalla HomePage
import 'bluetooth_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomePage(),
        '/bluetooth': (context) => Bluetooth(),
      },
    );
  }
}

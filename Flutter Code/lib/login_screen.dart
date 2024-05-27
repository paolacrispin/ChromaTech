import 'package:flutter/material.dart';
import 'home_page.dart'; // Asegúrate de importar tu pantalla HomePage

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20.0),
                Text(
                  'Bienvenido de Nuevo,',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.0),
                Text(
                  'Inicia sesión para seguir explorando tu armario iluminado.',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30.0),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'E-Mail',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Contraseña',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    suffixIcon: Icon(Icons.visibility),
                  ),
                ),
                SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '¿Olvidaste tu contraseña?',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(height: 50.0),
                ElevatedButton(
                  onPressed: () {
                    // Acción al presionar el botón Login
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: Text('LOGIN',),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Color(0xFF000018),
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        height: 36,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        height: 36,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("¿No tienes una cuenta? "),
                    GestureDetector(
                      onTap: () {
                        // Acción al presionar el enlace Signup
                        print("Sign-up link pressed");
                      },
                      child: Text(
                        'Regístrate',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

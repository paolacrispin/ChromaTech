import 'package:flutter/material.dart';
import 'package:prueba_examen/boton.dart';

class FichasGuardadas extends StatelessWidget {
  const FichasGuardadas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fichas Guardadas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Buscar',
              ),
            ),
            SizedBox(height: 20.0), // Espacio entre el campo de búsqueda y la ListView
            // ListView de elementos
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.folder),
                    title: Text('Paola'),
                    onTap: () {
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.folder),
                    title: Text('Tito'),
                    onTap: () {
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.folder),
                    title: Text('Ximena'),
                    onTap: () {
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 150.0),
            MyButton(text: "Cargar", onTap: () {
              Navigator.pushNamed(context, "/menupage");
            },),
            SizedBox(height: 100.0),
            // Fila de botones inferiores
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildIconButton(Icons.folder, "Fichas"),
                _buildIconButton(Icons.search, "Biblioteca"),
                _buildIconButton(Icons.notifications, "Puntologia"),
                _buildIconButton(Icons.person, "Perfil"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildIconButton(IconData iconData, String subtitle) {
  return Column(
    children: [
      IconButton(
        icon: Icon(iconData),
        onPressed: () {
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

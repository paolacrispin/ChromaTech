import 'package:flutter/material.dart';
import 'bluetooth_page.dart';
import 'corset.dart';
import 'bags.dart';
import 'dresses.dart';
import 'hats.dart';
import 'accesorios.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // App bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    // Name
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text(
                          "Hello,",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          "Valentina",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    // Profile picture
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.brown[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.person),
                    )
                  ],
                ),
              ),
              SizedBox(height: 25),
              // Card to connect Bluetooth
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage('images/img.png'),
                        height: size.height * 0.16,
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Conexión Bluetooth",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              "Conecta tu dispositivo móvil a tu prenda favorita",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 30),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(12),
                                backgroundColor: Colors.blueGrey[600],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {
                                // Acción al presionar el botón Login
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Bluetooth()),
                                );
                              },
                              child: Center(
                                child: Text("Conectar",
                                    style: TextStyle(color: Color(0xFFFFFFFF))),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25),
              // Categories
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildCategoryCard(
                            context, 'Corsets', 12, Colors.blueGrey[100],
                            CorsetPage(sendData: (data) {}),
                            'images/corset.png'),
                        _buildCategoryCard(
                            context, 'Bolsos', 2, Colors.brown[100], BagsPage(),
                            'images/corset.png'),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildCategoryCard(
                            context, 'Vestidos', 3, Colors.brown[100],
                            DressesPage(), 'images/corset.png'),
                        _buildCategoryCard(
                            context, 'Sombreros', 9, Colors.blueGrey[100],
                            HatsPage(), 'images/corset.png'),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildCategoryCard(
                            context, 'Accesorios', 7, Colors.blueGrey[100],
                            AccesoriosPage(), 'images/corset.png'),
                        _buildCategoryCard(
                            context, 'Blazers', 5, Colors.brown[100],
                            HatsPage(), 'images/corset.png'),
                        // Puedes cambiar esta línea por la página correcta si tienes una específica para Jackets
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, String title, int itemCount,
      Color? color, Widget destinationPage, String imagePath) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destinationPage),
          );
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Image(
                image: AssetImage(imagePath),
                height: 40,
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 5),
              Text(
                '$itemCount items',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
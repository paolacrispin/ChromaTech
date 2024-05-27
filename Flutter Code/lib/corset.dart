import 'package:flutter/material.dart';

class CorsetPage extends StatefulWidget {
  final Function(String) sendData;

  CorsetPage({required this.sendData});

  @override
  _CorsetPageState createState() => _CorsetPageState();
}

class _CorsetPageState extends State<CorsetPage> {
  String? selectedFilter;
  final List<Map<String, String>> corsets = [
    {'title': 'Corset 1', 'description': 'Descripción breve del Corset 1', 'imagePath': 'images/img.png', 'category': 'Primavera Cálido'},
    {'title': 'Corset 2', 'description': 'Descripción breve del Corset 2', 'imagePath': 'images/img.png', 'category': 'Otoño Cálido'},
    {'title': 'Corset 3', 'description': 'Descripción breve del Corset 3', 'imagePath': 'images/img.png', 'category': 'Invierno Frío'},
    {'title': 'Corset 4', 'description': 'Descripción breve del Corset 4', 'imagePath': 'images/img.png', 'category': 'Verano Frío'},
    {'title': 'Corset 5', 'description': 'Descripción breve del Corset 5', 'imagePath': 'images/img.png', 'category': 'Primavera Cálido'},
    {'title': 'Corset 6', 'description': 'Descripción breve del Corset 6', 'imagePath': 'images/img.png', 'category': 'Otoño Cálido'},
    {'title': 'Corset 7', 'description': 'Descripción breve del Corset 7', 'imagePath': 'images/img.png', 'category': 'Invierno Frío'},
    {'title': 'Corset 8', 'description': 'Descripción breve del Corset 8', 'imagePath': 'images/img.png', 'category': 'Verano Frío'},
    {'title': 'Corset 9', 'description': 'Descripción breve del Corset 9', 'imagePath': 'images/img.png', 'category': 'Primavera Cálido'},
    {'title': 'Corset 10', 'description': 'Descripción breve del Corset 10', 'imagePath': 'images/img.png', 'category': 'Otoño Cálido'},
    {'title': 'Corset 11', 'description': 'Descripción breve del Corset 11', 'imagePath': 'images/img.png', 'category': 'Invierno Frío'},
    {'title': 'Corset 12', 'description': 'Descripción breve del Corset 12', 'imagePath': 'images/img.png', 'category': 'Verano Frío'},
  ];

  List<bool> corsetStates = List.filled(12, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Corsets'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: Text('Selecciona tu colorimetria'),
                    value: selectedFilter,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedFilter = newValue;
                      });
                    },
                    items: <String>[
                      'Primavera Cálido',
                      'Otoño Cálido',
                      'Invierno Frío',
                      'Verano Frío',
                      'Mostrar todas',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: corsets
                    .asMap()
                    .entries
                    .where((entry) =>
                selectedFilter == null ||
                    selectedFilter == 'Mostrar todas' ||
                    entry.value['category'] == selectedFilter)
                    .map((entry) {
                  int index = entry.key;
                  Map<String, String> corset = entry.value;
                  return _buildCorsetItem(
                    corset['title']!,
                    corset['description']!,
                    corset['imagePath']!,
                        () => _onCorsetOnPressed(index),
                        () => _onCorsetOffPressed(index),
                    corsetStates[index],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCorsetItem(String title, String description, String imagePath, VoidCallback onOnPressed, VoidCallback onOffPressed, bool isOn) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset(imagePath, width: 80, height: 80),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              OutlinedButton(
                onPressed: onOnPressed,
                child: Text(
                  'On',
                  style: TextStyle(color: isOn ? Colors.green : Colors.black),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: isOn ? Colors.green : Colors.black),
                ),
              ),
              SizedBox(height: 10),
              OutlinedButton(
                onPressed: onOffPressed,
                child: Text(
                  'Off',
                  style: TextStyle(color: Colors.red),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.red),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onCorsetOnPressed(int index) {
    setState(() {
      corsetStates[index] = true;
      for (int i = 0; i < corsetStates.length; i++) {
        if (i != index) corsetStates[i] = false;
      }
    });
    // Lógica específica para encender LEDs del corset basado en el índice
    String data;
    switch (index) {
      case 0:
        data = 'j';
        break;
      case 1:
        data = 'a';
        break;
      case 2:
        data = 'd';
        break;
      case 3:
        data = 'g';
        break;
      case 4:
        data = 'k';
        break;
      case 5:
        data = 'b';
        break;
      case 6:
        data = 'e';
        break;
      case 7:
        data = 'h';
        break;
      case 8:
        data = 'l';
        break;
      case 9:
        data = 'c';
        break;
      case 10:
        data = 'f';
        break;
      case 11:
        data = 'i';
        break;
      default:
        data = '';
    }
    if (data.isNotEmpty) {
      widget.sendData(data);
    }
  }

  void _onCorsetOffPressed(int index) {
    setState(() {
      corsetStates[index] = false;
    });
    widget.sendData('p');
  }
}

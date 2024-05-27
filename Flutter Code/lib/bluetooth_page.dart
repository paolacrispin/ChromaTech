import 'dart:convert';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'corset.dart';

class Bluetooth extends StatefulWidget {
  const Bluetooth({super.key});

  @override
  State<Bluetooth> createState() => _MainPageState();
}

class _MainPageState extends State<Bluetooth> {
  final _bluetooth = FlutterBluetoothSerial.instance;
  bool _bluetoothState = false;
  bool _isConnecting = false;
  BluetoothConnection? _connection;
  List<BluetoothDevice> _devices = [];
  BluetoothDevice? _deviceConnected;

  void _getDevices() async {
    var res = await _bluetooth.getBondedDevices();
    setState(() => _devices = res);
  }

  void _sendData(String data) {
    if (_connection?.isConnected ?? false) {
      _connection?.output.add(ascii.encode(data));
    }
  }

  void _requestPermission() async {
    await Permission.location.request();
    await Permission.bluetooth.request();
    await Permission.bluetoothScan.request();
    await Permission.bluetoothConnect.request();
  }

  @override
  void initState() {
    super.initState();

    _requestPermission();

    _bluetooth.state.then((state) {
      setState(() => _bluetoothState = state.isEnabled);
    });

    _bluetooth.onStateChanged().listen((state) {
      switch (state) {
        case BluetoothState.STATE_OFF:
          setState(() => _bluetoothState = false);
          break;
        case BluetoothState.STATE_ON:
          setState(() => _bluetoothState = true);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Conexión Vía Bluetooth'),
      ),
      body: Column(
        children: [
          _controlBT(),
          _infoDevice(),
          Expanded(child: _listDevices()),
        ],
      ),
    );
  }

  Widget _controlBT() {
    return SwitchListTile(
      value: _bluetoothState,
      onChanged: (bool value) async {
        if (value) {
          await _bluetooth.requestEnable();
        } else {
          await _bluetooth.requestDisable();
        }
      },
      tileColor: Colors.black26,
      title: Text(
        _bluetoothState ? "Bluetooth encendido" : "Bluetooth apagado",
      ),
    );
  }

  Widget _infoDevice() {
    return ListTile(
      tileColor: Colors.black12,
      title: Text("Conectado a: ${_deviceConnected?.name ?? "ninguno"}"),
      trailing: _connection?.isConnected ?? false
          ? TextButton(
        onPressed: () async {
          await _connection?.finish();
          setState(() => _deviceConnected = null);
        },
        child: const Text("Desconectar"),
      )
          : TextButton(
        onPressed: _getDevices,
        child: const Text("Ver dispositivos"),
      ),
    );
  }

  Widget _listDevices() {
    return _isConnecting
        ? const Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
      child: Container(
        color: Colors.grey.shade100,
        child: Column(
          children: [
            ...[
              for (final device in _devices)
                ListTile(
                  title: Text(device.name ?? device.address),
                  trailing: TextButton(
                    child: const Text('Conectar'),
                    onPressed: () async {
                      setState(() => _isConnecting = true);

                      _connection = await BluetoothConnection.toAddress(device.address);
                      _deviceConnected = device;
                      _devices = [];
                      _isConnecting = false;

                      setState(() {});
                    },
                  ),
                )
            ]
          ],
        ),
      ),
    );
  }

  void navigateToCorsetPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CorsetPage(sendData: _sendData),
      ),
    );
  }
}

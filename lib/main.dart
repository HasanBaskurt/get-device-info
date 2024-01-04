import 'package:device_info_app/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(const DeviceInfoApp());

class DeviceInfoApp extends StatelessWidget {
  const DeviceInfoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Material App', home: Home());
  }
}

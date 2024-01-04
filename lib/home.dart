import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  String model = '-';
  String id = '-';
  String brand = '-';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Device Info'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('id : $id'),
            Text('brand : $brand'),
            Text('Model : $model'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (Platform.isAndroid) {
            AndroidDeviceInfo androidDeviceInfo =
                await deviceInfoPlugin.androidInfo;
            id = androidDeviceInfo.id;
            brand = androidDeviceInfo.brand;
            model = androidDeviceInfo.model;
          } else if (Platform.isIOS) {
            IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;
          }
          setState(() {});
        },
        child: const Icon(Icons.info_outline),
      ),
    );
  }
}

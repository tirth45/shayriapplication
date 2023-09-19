import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shari1/shayri6.dart';
import 'package:shari1/shyri2.dart';

// Haresh Push

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.pink),
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    forPermission();
  }

  DeviceInfoPlugin dd = DeviceInfoPlugin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalClass.Appbar("Shayri hindi"),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Category();
                },
              ));
            });
          },
          child: Text("welcome to shayri"),
        ),
      ),
    );
  }

  void forPermission() {
    dd.androidInfo.then((value) async {
      if (value.version.sdkInt >= 33) {
        var status = Permission.photos.status;
        if (await status.isDenied) {
          Permission.photos.request();
        }
      } else {
        var status = Permission.storage.status;
        if (await status.isDenied) {
          Permission.storage.request();
        }
      }
    });
  }
}

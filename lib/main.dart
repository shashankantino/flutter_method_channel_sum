import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:screen_lib/app_platform.dart';

String sum = "0000";

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await AppPlatformChannel.add(20, 20).then((value) {
        setState(() {
          sum = value;
        });

        log(value.toLowerCase());
      });
      log(sum.toLowerCase());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(sum),
        ),
      ),
    );
  }
}

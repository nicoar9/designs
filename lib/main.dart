import 'package:flutter/material.dart';
import 'package:designs/src/pages/emergency_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Design App',
      home: EmergencyPage(),
    );
  }
}

import 'package:designs/src/labs/slideshow_page.dart';
import 'package:designs/src/pages/pinterest_page.dart';
import 'package:designs/src/pages/slideshow_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Design App',
      home: PinterestPage(),
    );
  }
}

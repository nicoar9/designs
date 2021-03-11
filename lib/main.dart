import 'package:designs/src/pages/animated_box_page.dart';
import 'package:designs/src/pages/animation_page.dart';
import 'package:designs/src/labs/circular_progress_page.dart';
import 'package:designs/src/pages/graphics_page.dart';
import 'package:flutter/material.dart';

import 'package:designs/src/pages/headers_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Design App',
      home: GraphicsPage(),
    );
  }
}

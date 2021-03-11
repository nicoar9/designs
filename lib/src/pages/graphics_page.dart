import 'package:flutter/material.dart';
import 'package:designs/src/widgets/radial_progress.dart';

class GraphicsPage extends StatefulWidget {
  @override
  _GraphicsPageState createState() => _GraphicsPageState();
}

class _GraphicsPageState extends State<GraphicsPage> {
  double percentage = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              percentage += 10;
              if (percentage > 100) {
                percentage = 0;
              }
            });
          }),
      body: Center(
          child: Container(
        width: 300,
        height: 300,
        child: RadialProgress(percentage: percentage),
      )),
    );
  }
}

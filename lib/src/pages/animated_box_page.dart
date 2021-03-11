import 'package:flutter/material.dart';

class AnimatedBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _AnimatedBox(),
      ),
    );
  }
}

class _AnimatedBox extends StatefulWidget {
  @override
  __AnimatedBoxState createState() => __AnimatedBoxState();
}

class __AnimatedBoxState extends State<_AnimatedBox>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> moveRight;
  Animation<double> moveUp;
  Animation<double> moveLeft;
  Animation<double> moveDown;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4500),
    );

    controller.addListener(() {
      if (controller.isCompleted) {
        controller.repeat();
      }
    });

    moveRight = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.25, curve: Curves.bounceOut),
      ),
    );

    moveUp = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.25, 0.50, curve: Curves.bounceOut),
      ),
    );

    moveLeft = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.50, 0.75, curve: Curves.bounceOut),
      ),
    );

    moveDown = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.75, 1.0, curve: Curves.bounceOut),
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return AnimatedBuilder(
        animation: controller,
        child: Rectangulo(),
        builder: (BuildContext context, Widget child) {
          return Transform.translate(
            offset: Offset(moveRight.value + moveLeft.value,
                moveUp.value + moveDown.value),
            child: child,
          );
        });
  }
}

class Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}

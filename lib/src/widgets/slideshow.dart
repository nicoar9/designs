import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool dotsOnTop;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryBullet;
  final double secondaryBullet;

  Slideshow({
    @required this.slides,
    this.dotsOnTop = false,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
    this.primaryBullet = 12,
    this.secondaryBullet = 12,
  });
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SliderModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {
              Provider.of<_SliderModel>(context).primaryColor =
                  this.primaryColor;
              Provider.of<_SliderModel>(context).secondaryColor =
                  this.secondaryColor;
              Provider.of<_SliderModel>(context).primaryBullet =
                  this.primaryBullet;
              Provider.of<_SliderModel>(context).secondaryBullet =
                  this.secondaryBullet;
              return Column(
                children: [
                  if (this.dotsOnTop)
                    _Dots(
                      this.slides.length,
                    ),
                  Expanded(child: _Slides(this.slides)),
                  if (!this.dotsOnTop)
                    _Dots(
                      this.slides.length,
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;
  _Dots(
    this.totalSlides,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              totalSlides,
              (index) => _Dot(
                    index,
                  ))),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  _Dot(
    this.index,
  );
  @override
  Widget build(BuildContext context) {
    final slideshowModel = Provider.of<_SliderModel>(context);

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: slideshowModel.currentPage >= index - 0.5 &&
              slideshowModel.currentPage < index + 0.5
          ? slideshowModel.primaryBullet
          : slideshowModel.secondaryBullet.toDouble(),
      height: slideshowModel.currentPage >= index - 0.5 &&
              slideshowModel.currentPage < index + 0.5
          ? slideshowModel.primaryBullet
          : slideshowModel.secondaryBullet.toDouble(),
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: slideshowModel.currentPage >= index - 0.5 &&
                slideshowModel.currentPage < index + 0.5
            ? slideshowModel.primaryColor
            : slideshowModel.secondaryColor,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;
  _Slides(this.slides);
  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      Provider.of<_SliderModel>(context, listen: false).currentPage =
          pageViewController.page;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
          controller: pageViewController,
          children: widget.slides.map((element) => _Slide(element)).toList()),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slideWidget;

  _Slide(this.slideWidget);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(30),
        child: slideWidget);
  }
}

class _SliderModel with ChangeNotifier {
  double _currentPage = 0;
  Color _primaryColor = Colors.blue;
  Color _secondaryColor = Colors.grey;
  double _primaryBullet = 12;
  double _secondaryBullet = 12;

  double get currentPage => this._currentPage;

  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }

  Color get primaryColor => this._primaryColor;
  set primaryColor(Color color) {
    this._primaryColor = color;
  }

  Color get secondaryColor => this._secondaryColor;
  set secondaryColor(Color color) {
    this._secondaryColor = color;
  }

  double get primaryBullet => this._primaryBullet;

  set primaryBullet(double number) {
    this._primaryBullet = number;
  }

  double get secondaryBullet => this._secondaryBullet;

  set secondaryBullet(double number) {
    this._secondaryBullet = number;
  }
}

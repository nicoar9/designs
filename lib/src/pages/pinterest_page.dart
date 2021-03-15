import 'package:designs/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
          body: Stack(
        children: [
          PinterestGrid(),
          _MenuPosition(),
        ],
      )),
    );
  }
}

class _MenuPosition extends StatelessWidget {
  const _MenuPosition({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final show = Provider.of<_MenuModel>(context).show;
    return Positioned(
      bottom: 30,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Align(
          child: PinterestMenu(
            show: show,
            items: [
              PinterestButton(
                  onPressed: () {
                    print('Icon pie_chart');
                  },
                  icon: Icons.pie_chart),
              PinterestButton(
                  onPressed: () {
                    print('Icon search');
                  },
                  icon: Icons.search),
              PinterestButton(
                  onPressed: () {
                    print('Icon notifications');
                  },
                  icon: Icons.notifications),
              PinterestButton(
                  onPressed: () {
                    print('Icon supervised_user_circle');
                  },
                  icon: Icons.supervised_user_circle),
            ],
            // backgroundColor: Colors.red,
          ),
        ),
      ),
    );
  }
}

class PinterestGrid extends StatefulWidget {
  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (index) => index);
  ScrollController controller = ScrollController();
  double scrollNumber = 0;

  @override
  void initState() {
    controller.addListener(() {
      if (controller.offset > scrollNumber && controller.offset > 150) {
        Provider.of<_MenuModel>(context, listen: false).show = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).show = true;
      }
      scrollNumber = controller.offset;
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;

  _PinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: new Center(
          child: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('$index'),
          ),
        ));
  }
}

class _MenuModel with ChangeNotifier {
  bool _show = true;
  bool get show => this._show;

  set show(bool value) {
    this._show = value;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import '../components/NewDart.dart';
>>>>>>> 724274668add002ace00f84442b851fd22548a28


class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
          // GridViewPage()
          GridViewPage(),
          // Divider(),
          // MyDraggableTarget(data:'456')
    );
  }
}

<<<<<<< HEAD
=======



class GridViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 3.0, //item宽高比
      scrollDirection: Axis.vertical, //默认vertical
      crossAxisCount: 2, //列数
      children: _buildGridChildren(context),
    );
  }

  //生成widget列表
  List<Widget> _buildGridChildren(BuildContext context) {
    final List list = List<Widget>();
    for (int x = 0; x < 12; x++) {
      list.add(
        MyDraggableTarget(data: 'x = $x')
      );
    }
    return list;
  }
}
>>>>>>> 724274668add002ace00f84442b851fd22548a28






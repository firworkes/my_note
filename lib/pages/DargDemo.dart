import 'package:flutter/material.dart';
// import '../components/DartDemoItem.dart';
import 'package:w_reorder_list/w_reorder_list.dart';

class DargDemo extends StatelessWidget {
  const DargDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WReorderList({	
        Key key,	
        @required this.children,	
        @required this.onIndexChanged,	
        this.duration = const Duration(milliseconds: 500)	
      }) : super(key: key);
    );
  }
}
import 'package:flutter/material.dart';
import 'dart:math';

// import '../components/DartDemoItem.dart';
import 'package:w_reorder_list/w_reorder_list.dart';

class DargDemo extends StatelessWidget {
  const DargDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage()
    //   WReorderList(	
    //     key: key,	
    //     children: children,	
    //     onIndexChanged: (a, b) {	
    //       setState(() {	
    //         var temp = _colors[a];	
    //         _colors[a] = _colors[b];	
    //         _colors[b] = temp;	
    //       });	
    //     },
    //   )	
    );
  }
}



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
 
class _HomePageState extends State<HomePage> {
  List list = List.generate(Random().nextInt(20)+10, (i) => 'More Item$i');
 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
 
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('listview reorded'),
      ),
      body: Center(
        child: ReorderableListView(
            children: list
                .map((m) => ListTile(
                key: ObjectKey(m),
                title: Text(m),
            )).toList(),//不要忘记 .toList()
            onReorder: _onReorder,
        ),
      ),
    );
  }
 
  _onReorder(int oldIndex, int newIndex){
    print('oldIndex: $oldIndex , newIndex: $newIndex');
      setState(() {
        if (newIndex == list.length){
          newIndex = list.length - 1;
        }
        var item = list.removeAt(oldIndex);
        list.insert(newIndex, item);
      });
  }
}

import 'package:flutter/material.dart';
<<<<<<< HEAD

=======
import 'dart:math';

// import '../components/DartDemoItem.dart';
import 'package:w_reorder_list/w_reorder_list.dart';
>>>>>>> 724274668add002ace00f84442b851fd22548a28

class DargDemo extends StatelessWidget {
  const DargDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      body: Demo()
    );
  }
}

class Demo extends StatefulWidget {
  Demo({Key key}) : super(key: key);

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {

  List<String> items = List.generate(20, (int i) => '$i');

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      children: <Widget>[
        for (String item in items)
          Container(
            key: ValueKey(item),
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            decoration: BoxDecoration(
                color:
                    Colors.primaries[int.parse(item) % Colors.primaries.length],
                borderRadius: BorderRadius.circular(10)),
          )
      ],
      onReorder: (int oldIndex, int newIndex) {
        if (oldIndex < newIndex) {
          newIndex -= 1;
        }
        var child = items.removeAt(oldIndex);
        items.insert(newIndex, child);
        setState(() {});
      },
=======
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
>>>>>>> 724274668add002ace00f84442b851fd22548a28
    );

  }
}

<<<<<<< HEAD
// class Demo extends StatefulWidget {
//   @override
//   _DemoState createState() => _DemoState();
// }

// class _DemoState extends State<Demo> {
//   List<int> list = [];

//   @override
//   void initState() {
//     super.initState();
//     for (int i = 0; i < 20; i++) {
//       list.add(i);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ReorderableListView(
//         children: list.map(f).toList(),
//         header: Text('This is the header!'),
//         onReorder: (oldIndex, newIndex) {
//           setState(() {
//             _updateMyItems(oldIndex, newIndex);
//           });
//         });
//   }

//   void _updateMyItems(int oldIndex, int newIndex) {
//     var tmp = list[oldIndex];
//     list[oldIndex] = list[newIndex];
//     list[newIndex] = tmp;
//   }

//   Widget f(int i) {
//     return ListTile(
//       key: ValueKey("$i"),
//       title: Text('Item $i'),
//     );
//   }
// }
=======


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
>>>>>>> 724274668add002ace00f84442b851fd22548a28

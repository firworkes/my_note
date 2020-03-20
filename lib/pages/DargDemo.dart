import 'package:flutter/material.dart';


class DargDemo extends StatelessWidget {
  const DargDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );

  }
}

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

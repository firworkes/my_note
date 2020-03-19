import 'package:flutter/material.dart';
import '../components//draggable_demo.dart';


class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          MyDraggableTarget(data:'123'),
          Divider(),
          MyDraggableTarget(data:'456')
        ],
      ),
    );
  }
}

// class DragDemo extends StatefulWidget {
//   DragDemo({Key key}) : super(key: key);

//   @override
//   _DragDemoState createState() => _DragDemoState();
// }

// class _DragDemoState extends State<DragDemo> {
//   @override
//   Widget build(BuildContext context) {
//     return Draggable(
//       data: 'sss',
//       axis: Axis.vertical,
//       child: ListView(
//         children: <Widget>[
//           ListTile(
//             title: Text('1.笔记标题'),
//             subtitle: Text('笔记内容'),
//           )
//         ],
//       ), 
//       feedback: ListView(children: <Widget>[
//         ListTile(
//             title: Text('1.笔记标题',style: TextStyle(color: Colors.grey),),
//             subtitle: Text('笔记内容',style: TextStyle(color: Colors.grey)),
//           )
//       ],),
//     );
//   }
// }

// class MyDraggable extends StatelessWidget {
//   final data;
//   const MyDraggable({this.data = "这是可拖拽盒子", Key key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return 
//     Draggable(
//       data: data,
//       child: Container(
//         width: 150.0,
//         height: 150.0,
//         color: Colors.red[500],
//         child: Center(
//           child: Text(this.data),
//         ),
//       ),
//       feedback: Container(
//         width: 150.0,
//         height: 150.0,
//         color: Colors.blue[500],
//         child: Icon(Icons.feedback),
//       ),
//     );
//   }

// }



// class MyDragTarget extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _MyDragTargetState();
// }
// class _MyDragTargetState extends State<MyDragTarget> {
//   var targetText = "第二个盒子";//用于显示的文案
//   @override
//   Widget build(BuildContext context) {
//     return Draggable(
//       data: targetText,
//       child: Container(
//         height: 150.0,
//         width: 150.0,
//         color: Colors.red[500],
//         child: DragTarget(
//             onWillAccept: (data) {
//               print("data = $data onWillAccept");
//               return data != null;//当Draggable传递过来的dada不是null的时候 决定接收该数据。
//             },
//             onAccept: (data) {
//               print("data = $data onAccept");
//               setState(() {
//                 targetText = data;//接收该数据后修改文案内容。
//               });
//             },
//             onLeave: (data) {
//               print("data = $data onLeave");//我来了 我又走了
//             },
//             builder: (context, candidateData, rejectedData) {
//               //这是DragTarget实际展示给用户看到的样子
//               return Container(
//                 width: 150.0,
//                 height: 150.0,
//                 color: Colors.blue[500],
//                 child: Center(
//                   child: Text(this.targetText),
//                 ),
//               );
//             },
//           )
//       ), 
//       feedback: Container(
//         width: 150.0,
//         height: 150.0,
//         color: Colors.blue[500],
//         child: Icon(Icons.feedback),

//       )
//     );
//   }
// }

class MyDraggableTarget<T> extends StatefulWidget {
  final T data;

  MyDraggableTarget({@required this.data, Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyDraggableTargetState(text: data);
}

class _MyDraggableTargetState extends State<MyDraggableTarget> {
  var text;

  _MyDraggableTargetState({@required this.text});
  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: text,
      child: Container(//仅用于保持样式，可以使用DragTarget作为直接child。
        width: 150.0,
        height: 150.0,
        color: Colors.red[500],
        child: DragTarget(
          onWillAccept: (data) {
            print("data = $data onWillAccept");
            return data != null;
          },
          onAccept: (data) {
            print("data = $data onAccept");
            setState(() {
              text = data;
            });
          },
          onLeave: (data) {
            print("data = $data onLeave");
          },
          builder: (context, candidateData, rejectedData) {
            return Container(
              width: 150.0,
              height: 150.0,
              color: Colors.blue[500],
              child: Center(
                child: Text(text),
              ),
            );
          },
        ),
      ),
      feedback: Container(
        width: 150.0,
        height: 150.0,
        color: Colors.blue[500],
        child: Icon(Icons.feedback),
      ),
    );
  }
}
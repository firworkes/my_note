import 'package:flutter/material.dart';


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
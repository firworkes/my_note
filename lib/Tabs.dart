import 'package:flutter/material.dart';
import 'pages/Index.dart';
import 'pages/Login.dart';
import 'res/listData.dart';

class Tabs extends StatefulWidget {
  final index;

  Tabs({Key key,this.index = 0}) : super(key: key);

  @override
  _TabsState createState() => _TabsState(this.index);
}

class _TabsState extends State<Tabs> {

  int _currentIndex;

  _TabsState(index){
    this._currentIndex = index;
  }

  List _listPage = [
    Index(),
    Login()
  ];

  SelectView(IconData icon, String text, String id) {
      return new PopupMenuItem<String>(
          value: id,
          child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                  new Icon(icon, color: Colors.blue),
                  new Text(text),
              ],
          )
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(

        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('所有笔记',style: TextStyle(color: Colors.black),),
        actions: <Widget>[

          IconButton(
            
            icon: Icon(Icons.offline_bolt,color: Colors.black,), 
            onPressed: null
          ),
          IconButton(
            icon: Icon(Icons.search,color: Colors.black), 
            onPressed: null
          ),

            // 隐藏的菜单
        new PopupMenuButton<String>(
            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                this.SelectView(Icons.message, '发起群聊', 'A'),
                this.SelectView(Icons.group_add, '添加服务', 'B'),
                this.SelectView(Icons.cast_connected, '扫一扫码', 'C'),
            ],
            onSelected: (String action) {
                // 点击选项的时候
                switch (action) {
                    case 'A': break;
                    case 'B': break;
                    case 'C': break;
                }
            },
        ),

        ],
        // bottom: AppBar(
          
        //   backgroundColor: Colors.white,
        //   title: Text('所有笔记',style: TextStyle(color:Colors.black),),
        // )

      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          child: Icon(Icons.add),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        


      body: this._listPage[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex,
        onTap: (int index){
          setState(() {
            this._currentIndex = index;
            
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('首页')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('登录')
          ),
        ],
      ),

      //侧边栏
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.white
                    ),
                    currentAccountPicture:CircleAvatar(
                      backgroundImage: NetworkImage('https://www.itying.com/images/flutter/3.png'),
                    ),
                    accountName: Text('Firworkes',style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold)),
                    otherAccountsPictures: <Widget>[
                      Column(children: <Widget>[
                        Icon(Icons.offline_bolt),
                        Text('升级账户',style: TextStyle(fontSize: 10),)
                      ],)
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: listData.map((value){
                return 
                  ListTile(
                    leading: Icon(value['myicon']),
                    title: Text(value['title']),
                  );
              }).toList()
            )
          ],
        ),
      )
    );
  }
}
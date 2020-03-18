
import 'package:flutter/material.dart';
import '../pages/Index.dart';
import '../pages/Login.dart';
import '../Tabs.dart';

final routes= {
  '/' : (context) => Tabs(),
  '/index' : (context) => Index(),
  '/login' : (context) => Login()
};

//固定写法
var onGenerateRoute=(RouteSettings settings) {
      // 统一处理
      final String name = settings.name; 
      final Function pageContentBuilder = routes[name];
      if (pageContentBuilder != null) {
        if (settings.arguments != null) {
          final Route route = MaterialPageRoute(
              builder: (context) =>
                  pageContentBuilder(context, arguments: settings.arguments));
          return route;
        }else{
            final Route route = MaterialPageRoute(
              builder: (context) =>
                  pageContentBuilder(context));
            return route;
        }
      }
};
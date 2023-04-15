import 'package:flutter/material.dart';
import 'package:pbm1/pages/homePage.dart';
import 'package:pbm1/pages/login.dart';
import 'pages/login.dart';
import 'pages/regis.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/login':(context) => Login(),
        '/regis':(context) => Regis(),
        '/home':(context) => homePage()
      },
      initialRoute: '/login',
    );}
}  
import 'package:flutter/material.dart';
import 'pages/entry.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Agora&Flutter',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new IndexPage(),
    );
  }
}

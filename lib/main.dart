import 'package:flutter/material.dart';

import 'componentes/caderno_widget.dart';
import 'entitys/custom_point.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var points = <CustomPoint>[];
  var colors = <MaterialColor>[
    Colors.red,
    Colors.pink,
    Colors.green,
    Colors.purple,
    Colors.amber,
    Colors.blue,
    Colors.orange,
    Colors.brown,
  ];
  var _color = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onPanStart: (detailsPoint) {
          setState(() {
            var offset = detailsPoint.globalPosition;
            points.add(CustomPoint(offset: offset, color: _color));
          });
        },
        onPanUpdate: (detailsPoint) {
          setState(() {
            var offset = detailsPoint.globalPosition;
            points.add(CustomPoint(offset: offset, color: _color));
          });
        },
        onPanDown: (detailsPoint) {
          setState(() {
            points.add(null);
          });
        },
        child: Caderno(
          points: points,
          colors: colors,
          onItemColorTap: (index) {
            setState(() {
              _color = colors[index];
            });
          },
        ),
      ),
    );
  }
}



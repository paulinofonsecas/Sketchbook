import 'dart:ui';

import 'package:flutter/material.dart';

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
  var colors = [
    Colors.red,
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
        child: Container(
          child: Stack(
            children: [
              CustomPaint(
                painter: CadernoPainter(points: points,),
                child: Container(),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: _buildPainelDeCores(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildPainelDeCores() {
    return Container(
      width: 80,
      height: 900,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
      child: ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _color = colors[index];
                });
              },
              child: Container(
                margin: EdgeInsets.all(10),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  color: colors[index],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomPoint {
  final Offset offset;
  final Color color;

  CustomPoint({this.offset, this.color});
}

class CadernoPainter extends CustomPainter {
  final List<CustomPoint> points;

  const CadernoPainter({this.points});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 3.0;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(
          points[i].offset,
          points[i + 1].offset,
          paint..color = points[i].color,
        );
      } else if (points[i] != null && points[i + 1] == null) {
        canvas.drawPoints(
          PointMode.points,
          [points[i].offset],
          paint..color = points[i].color,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

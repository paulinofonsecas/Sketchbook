import 'package:caderno_de_desenho/componentes/painel_de_cores.dart';
import 'package:caderno_de_desenho/entitys/custom_point.dart';
import 'package:flutter/material.dart';

import 'caderno_painter.dart';

class Caderno extends StatelessWidget {
  const Caderno({
    Key key,
    @required this.points,
    @required this.colors,
    this.onItemColorTap,
  }) : super(key: key);

  final List<CustomPoint> points;
  final Function(int index) onItemColorTap;
  final List<MaterialColor> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          CustomPaint(
            painter: CadernoPainter(
              points: points,
            ),
            child: Container(),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: PainelDeCores(
              colors: colors,
              onItemColorTap: onItemColorTap,
            ),
          ),
        ],
      ),
    );
  }
}

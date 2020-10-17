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
          Positioned(
            top: 0,
            left: 0,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: Colors.blue,
                  ),
                  child: Text(
                    'Selecionar a cor do funto',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.black,
                  child: CustomPaint(
                    painter: CadernoPainter(
                      points: points,
                    ),
                    child: Container(),
                  ),
                ),
              ),
              PainelDeCores(
                colors: colors,
                onItemColorTap: onItemColorTap,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class PainelDeCores extends StatelessWidget {
  const PainelDeCores({
    Key key,
    @required this.colors,
    @required this.onItemColorTap,
  }) : super(key: key);

  final List<MaterialColor> colors;
  final Function(int index) onItemColorTap;

  Widget buildItem(BuildContext context, int index) {
    return Center(
      child: GestureDetector(
        onTap: () => onItemColorTap(index),
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
  }

  @override
  Widget build(BuildContext context) {
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
        itemBuilder: buildItem,
      ),
    );
  }
}

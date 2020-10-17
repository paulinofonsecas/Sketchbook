import 'package:flutter/material.dart';

class PainelDeCores extends StatefulWidget {
  const PainelDeCores({
    Key key,
    @required this.colors,
    @required this.onItemColorTap,
    this.visible,
  }) : super(key: key);

  final List<MaterialColor> colors;
  final Function(int index) onItemColorTap;
  final bool visible;

  @override
  _PainelDeCoresState createState() => _PainelDeCoresState();
}

class _PainelDeCoresState extends State<PainelDeCores> {

  Widget buildItem(BuildContext context, int index) {
    return Center(
      child: GestureDetector(
        onTap: () => widget.onItemColorTap(index),
        child: Container(
          margin: EdgeInsets.all(10),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(90),
            color: widget.colors[index],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.visible,
      child: Container(
        height: MediaQuery.of(context).size.height - 100,
        width: MediaQuery.of(context).size.width * 0.15,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
          ),
        ),
        child: ListView.builder(
          itemCount: widget.colors.length,
          itemBuilder: buildItem,
        ),
      ),
    );
  }
}

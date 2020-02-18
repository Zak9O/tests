import 'package:flutter/cupertino.dart';

///Container
const EdgeInsets containerMargin = EdgeInsets.all(15);
const double containerBorderRadius = 8.0;

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget child;

  ReusableCard({this.color, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: containerMargin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(containerBorderRadius),
        color: color,
      ),
    );
  }
}

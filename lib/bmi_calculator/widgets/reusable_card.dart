import 'package:flutter/cupertino.dart';
import '../bmi_constants.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function onTap;
  final double height;
  final double width;

  ReusableCard({this.color, this.child, this.onTap, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        child: child,
        margin: kReusableCardMargin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kReusableCardBorderRadius),
          color: color,
        ),
      ),
    );
  }
}

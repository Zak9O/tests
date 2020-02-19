import 'package:flutter/cupertino.dart';
import 'bmi_constants.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function onTap;

  ReusableCard({this.color, this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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

import 'package:flutter/material.dart';

class CardHolder extends StatelessWidget {
  final Widget child;
  final double? margin;
  const CardHolder({super.key, required this.child, this.margin});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          margin: EdgeInsets.symmetric(
            vertical: (margin != null) ? margin! : 10.0,
          ),
          padding: EdgeInsets.all(10.0),
          alignment: Alignment.center,
          width: constraints.maxWidth * 0.85,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Color(0x362D2D2D),
                offset: Offset(0, 2),
                blurRadius: 2,
              ),
            ],

            color: Colors.white,
          ),
          child: child,
        );
      },
    );
  }
}
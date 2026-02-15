import 'package:flutter/material.dart';

class CardHolder extends StatelessWidget {
  final Widget child;
  const CardHolder({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.85,
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
  }
}
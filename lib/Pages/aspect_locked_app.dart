import 'package:flutter/material.dart';
import 'package:nation_identity_application/WidgetTree.dart';
import 'dart:math';

import 'package:nation_identity_application/constants.dart';

class AspectLockedApp extends StatelessWidget {
  const AspectLockedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FittedBox(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Color(0x59000000),
                offset: Offset(0, 0),
                blurRadius: 30,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(10),
            clipBehavior: Clip.hardEdge,
            child: SizedBox(
              width: KConstants.designWidth,
              height: KConstants.designHeight,
              child: WidgetTree(),
            ),
          ),
        ),
      ),
    );
  }
}
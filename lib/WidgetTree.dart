import 'package:flutter/material.dart';
import 'package:nation_identity_application/Scrolling/PageScrollWidget.dart';
import 'package:nation_identity_application/Pages/page_manager_widget.dart';
import 'package:nation_identity_application/data.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  void dispose() {
    currentPage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        PageManagerWidget(),

        Transform.translate(
          offset: Offset(0, MediaQuery.of(context).size.height * 0.7),
          child: PageScrollWidget(),
        ),
      ],
    );
  }
}
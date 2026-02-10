import 'package:flutter/material.dart';
import 'package:nation_identity_application/data.dart';

import 'PageHolderWidget.dart';

class PageManagerWidget extends StatefulWidget {
  const PageManagerWidget({super.key});

  @override
  State<PageManagerWidget> createState() => _PageManagerWidgetState();
}

class _PageManagerWidgetState extends State<PageManagerWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: currentPage,
      builder: (context, value, child) {
        return Stack(
          children: [
            ...List.generate(allPages.length, (index) {
              return PageHolderWidget(pageInfo: allPages.elementAt(index));
            }),
          ],
        );
      },
    );
  }
}
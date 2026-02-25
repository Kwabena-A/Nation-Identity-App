import 'package:flutter/material.dart';

import '../data.dart';

class ScrollObjectWidget extends StatefulWidget {
  final PageInfo pageInfo;
  final int index;
  const ScrollObjectWidget({
    super.key,
    required this.pageInfo,
    required this.index,
  });

  @override
  State<ScrollObjectWidget> createState() => _ScrollObjectWidgetState();
}

class _ScrollObjectWidgetState extends State<ScrollObjectWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _scaleAnimation;

  late ScrollController pastController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    _scaleAnimation = Tween(begin: 1.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  double currentScaleFactor(int currentPage) {
    double equationFactor = -((currentPage - widget.index).abs() / 7.5) + 1;
    return (equationFactor > 0) ? equationFactor : 0.01;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: currentPage,
      builder: (context, value, child) {
        _scaleAnimation =
            Tween(
              begin: _scaleAnimation.value,
              end: 95 * currentScaleFactor(currentPage.value),
            ).animate(
              CurvedAnimation(
                parent: _animationController,
                curve: Curves.easeInOut,
              ),
            );
        _animationController.reset();
        _animationController.forward();

        return AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return GestureDetector(
              onTap: () {
                activeScrollController.animateTo(
                  0,
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                );
                void listenerFunction() {
                  if (activeScrollController.offset == 0) {
                    currentPage.value = widget.index;
                    activeScrollController.removeListener(listenerFunction);
                  }
                }

                activeScrollController.addListener(listenerFunction);
                activeScrollController.notifyListeners();
              },
              child: Container(
                width: _scaleAnimation.value,
                height: _scaleAnimation.value,
                padding: EdgeInsets.all(5.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(widget.pageInfo.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
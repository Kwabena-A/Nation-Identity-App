import 'package:flutter/material.dart';
import 'package:nation_identity_application/Scrolling/scroll_object_widget.dart';
import 'package:nation_identity_application/data.dart';

class PageScrollWidget extends StatefulWidget {
  const PageScrollWidget({super.key});

  @override
  State<PageScrollWidget> createState() => _PageScrollWidgetState();
}

class _PageScrollWidgetState extends State<PageScrollWidget>
    with SingleTickerProviderStateMixin {
  final ValueNotifier<double> _scrollOffset = ValueNotifier(0);
  late ScrollController _currentController;

  ScrollController scrollController = ScrollController();

  double leftOffset = 0;
  double rightOffset = 0;

  late AnimationController _animationController;
  late Animation _leftOffsetAnimation;
  late Animation _rightOffsetAnimation;
  late Listenable offsetListener;

  late Animation _boxColorAnimation;

  @override
  void initState() {
    // Update current controller for scroll to match edge y pos
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _currentController = activeScrollController;
      _currentController.addListener(_updatePosition);
      currentPage.addListener(_onPageChange);
    });

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    _leftOffsetAnimation = Tween(begin: 0.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    _rightOffsetAnimation = Tween(begin: 0.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    offsetListener = Listenable.merge([
      _leftOffsetAnimation,
      _rightOffsetAnimation,
    ]);

    _boxColorAnimation =
        ColorTween(
          begin: Colors.white,
          end: allPages.elementAt(0).colorTheme,
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      offsetListener.addListener(moveScroller);
    });

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    _scrollOffset.dispose();
    _animationController.dispose();

    _currentController.removeListener(_updatePosition);
    currentPage.removeListener(_onPageChange);
    offsetListener.removeListener(moveScroller);

    super.dispose();
  }

  void _updatePosition() {
    _scrollOffset.value = _currentController.offset;
  }

  void _onPageChange() {
    _currentController.removeListener(_updatePosition);
    _currentController = activeScrollController;
    _currentController.addListener(_updatePosition);
  }

  void moveScroller() {
    scrollController.jumpTo(
      (_rightOffsetAnimation.value / 2) +
          (scrollController.position.maxScrollExtent / 2) -
          (_leftOffsetAnimation.value / 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: currentPage,
      builder: (context, value, child) {
        // Set Center object by moving scroll controller
        int countAfter = allPages.length - (currentPage.value + 1);
        int countBefore = allPages.length - (countAfter + 1);

        leftOffset = 0;
        for (int i = countBefore + 1; i <= countAfter; i++) {
          double scaleFactor = -(i / 7.5) + 1;
          leftOffset += 95 * scaleFactor;
        }

        rightOffset = 0;
        for (int i = countAfter + 1; i <= countBefore; i++) {
          double scaleFactor = -(i / 7.5) + 1;
          rightOffset += 95 * scaleFactor;
        }
        _leftOffsetAnimation =
            Tween(begin: _leftOffsetAnimation.value, end: leftOffset).animate(
              CurvedAnimation(
                parent: _animationController,
                curve: Curves.easeIn,
              ),
            );
        _rightOffsetAnimation =
            Tween(begin: _rightOffsetAnimation.value, end: rightOffset).animate(
              CurvedAnimation(
                parent: _animationController,
                curve: Curves.easeIn,
              ),
            );

        _boxColorAnimation =
            ColorTween(
              begin: _boxColorAnimation.value,
              end: allPages.elementAt(currentPage.value).colorTheme,
            ).animate(
              CurvedAnimation(
                parent: _animationController,
                curve: Curves.easeInOut,
              ),
            );

        _animationController.reset();
        _animationController.forward();
        return ValueListenableBuilder(
          valueListenable: _scrollOffset,
          builder: (context, value, child) {
            return LayoutBuilder(
              builder: (context, constraints) {
                return Transform.translate(
                  offset: Offset(0, _scrollOffset.value * -1),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Container(
                        height: 100,
                        alignment: Alignment.center,
                        child: ClipRect(
                          clipBehavior: Clip.hardEdge,
                          child: SingleChildScrollView(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.symmetric(
                              horizontal: constraints.maxWidth,
                            ),
                            controller: scrollController,
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ...List.generate(allPages.length, (index) {
                                  return ScrollObjectWidget(
                                    pageInfo: allPages.elementAt(index),
                                    index: index,
                                  );
                                }),
                              ],
                            ),
                          ),
                        ),
                      ),

                      AnimatedBuilder(
                        animation: _boxColorAnimation,
                        builder: (context, child) {
                          return Positioned.fill(
                            child: Center(
                              child: Container(
                                width: 95 - 10,
                                height: 95 - 10,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFFF),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: _boxColorAnimation.value,

                                    width: 5,
                                    strokeAlign: BorderSide.strokeAlignOutside,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
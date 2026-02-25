import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nation_identity_application/Pages/TextSectionWidget.dart';
import 'package:nation_identity_application/data.dart';

import '../constants.dart';

class PageHolderWidget extends StatefulWidget {
  final PageInfo pageInfo;
  const PageHolderWidget({super.key, required this.pageInfo});

  @override
  State<PageHolderWidget> createState() => _PageHolderWidgetState();
}

class _PageHolderWidgetState extends State<PageHolderWidget>
    with TickerProviderStateMixin {
  late AnimationController _movementAnimationController;
  late Animation _movementAnimation;

  late AnimationController _imageAnimationController;
  late Animation _imageAnimation;

  late AnimationController _textTransformAnimationController;
  late Animation _textTransformAnimation;

  late Listenable _animationControllers;

  final ScrollController _scrollController = ScrollController();

  late int index;

  @override
  void initState() {
    index = allPages.indexOf(widget.pageInfo);
    currentPage.addListener(() {
      if (index == currentPage.value) {
        activeScrollController = _scrollController;
      }
    });

    _movementAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    _movementAnimation = Tween(begin: (index == 0) ? 0.0 : 500.0, end: 0.0)
        .animate(
          CurvedAnimation(
            parent: _movementAnimationController,
            curve: Curves.easeInOut,
          ),
        );

    _textTransformAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _textTransformAnimation = Tween(begin: 100.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _textTransformAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    _imageAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 20),
    );
    _imageAnimation = Tween(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _imageAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationControllers = Listenable.merge([
      _movementAnimationController,
      _imageAnimationController,
      _textTransformAnimationController,
    ]);

    currentPage.addListener(() {
      if (index == currentPage.value) {
        if (!_imageAnimationController.status.isForwardOrCompleted) {
          _imageAnimationController.duration = Duration(seconds: 20);
          _imageAnimationController.forward();
        }

        if (!_textTransformAnimationController.status.isForwardOrCompleted) {
          _textTransformAnimationController.forward();
        }
      } else {
        if (!_imageAnimationController.status.isDismissed &&
            _imageAnimationController.status != AnimationStatus.reverse) {
          _imageAnimationController.duration = Duration(seconds: 3);
          _imageAnimationController.reverse();
        }

        if (!_textTransformAnimationController.status.isDismissed &&
            _textTransformAnimationController.status !=
                AnimationStatus.reverse) {
          _textTransformAnimationController.reverse();
        }
      }
    });

    currentPage.addListener(_movePage);
    currentPage.addListener(updateController);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      currentPage.notifyListeners();
    });
    super.initState();
  }

  void _movePage() {
    if (currentPage.value == index) {
      activeScrollController = _scrollController;
      animate(0);
    } else {
      animate((index > currentPage.value ? 1.2 : -0.2));
    }
  }

  @override
  void dispose() {
    _movementAnimationController.dispose();
    _imageAnimationController.dispose();
    _textTransformAnimationController.dispose();
    _scrollController.dispose();
    super.dispose();
    currentPage.removeListener(_movePage);
    currentPage.removeListener(updateController);
  }

  void updateController() {
    if (index == currentPage.value) {
      activeScrollController = _scrollController;
    }
  }

  void animate(double animateTo) {
    _movementAnimation =
        Tween(
          begin: _movementAnimation.value,
          end: KConstants.designWidth * (animateTo),
        ).animate(
          CurvedAnimation(
            parent: _movementAnimationController,
            curve: Curves.easeInOut,
          ),
        );

    _movementAnimationController.reset();
    _movementAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    int titleAlpha = 220;
    return AnimatedBuilder(
      animation: _animationControllers,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_movementAnimation.value, 0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x59000000),
                      offset: Offset(-5, 0),
                      blurRadius: 30,
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    SizedBox(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      child: ClipRect(
                        clipBehavior: Clip.hardEdge,
                        child: Transform.scale(
                          scale: _imageAnimation.value,
                          child: Image.asset(
                            widget.pageInfo.image,
                            alignment: (widget.pageInfo.imageAlignment != null)
                                ? widget.pageInfo.imageAlignment!
                                : Alignment.center,

                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 50, top: 50, right: 20),
                      alignment: Alignment.topRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Transform.translate(
                            offset: Offset(
                              0,
                              _textTransformAnimation.value * -0.3,
                            ),
                            child: SvgPicture.string(
                              KIcons.quoteIcon,
                              height: 30,
                              width: 30,
                              color: (widget.pageInfo.titleColor != null)
                                  ? widget.pageInfo.titleColor!.withAlpha(
                                      titleAlpha,
                                    )
                                  : Colors.black.withAlpha(titleAlpha),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Transform.translate(
                                offset: Offset(
                                  _textTransformAnimation.value,
                                  0,
                                ),
                                child: Container(
                                  width: 250,
                                  alignment: Alignment.centerRight,
                                  child: FittedBox(
                                    child: Text(
                                      widget.pageInfo.title,
                                      textAlign: TextAlign.right,
                                      style: GoogleFonts.getFont(
                                        color:
                                            (widget.pageInfo.titleColor != null)
                                            ? widget.pageInfo.titleColor!
                                                  .withAlpha(titleAlpha)
                                            : Colors.black.withAlpha(
                                                titleAlpha,
                                              ),
                                        "Bodoni Moda",
                                        fontSize: 40,
                                        fontWeight: FontWeight.w800,
                                        height: 1.2,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Transform.translate(
                                offset: Offset(
                                  _textTransformAnimation.value * 0.9,
                                  0,
                                ),
                                child: Container(
                                  width: 350,
                                  child: Text(
                                    widget.pageInfo.description,
                                    textAlign: TextAlign.right,
                                    style: GoogleFonts.getFont(
                                      color:
                                          (widget.pageInfo.titleColor != null)
                                          ? widget.pageInfo.titleColor!
                                                .withAlpha(titleAlpha)
                                          : Colors.black.withAlpha(titleAlpha),
                                      "Sora",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    NotificationListener<OverscrollIndicatorNotification>(
                      onNotification: (overscroll) {
                        overscroll.disallowIndicator();
                        return true;
                      },
                      child: SingleChildScrollView(
                        controller: _scrollController,

                        padding: EdgeInsets.only(
                          top: constraints.maxHeight * 0.75,
                        ),
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(top: 60),
                          color: Colors.white.withAlpha(240),
                          child: Column(
                            children: [
                              ...List.generate(
                                widget.pageInfo.textSections.length,
                                (index) {
                                  return widget.pageInfo.textSections.elementAt(
                                    index,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
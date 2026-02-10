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
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final ScrollController _scrollController = ScrollController();
  late Animation _animation;
  late int index;

  @override
  void initState() {
    index = allPages.indexOf(widget.pageInfo);
    if (index == currentPage.value) {
      activeScrollController = _scrollController;
    }
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    _animation = Tween(begin: (index == 0) ? 0.0 : 500.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    currentPage.addListener(_movePage);
    currentPage.addListener(() {
      if (index == currentPage.value) {
        activeScrollController = _scrollController;
      }
    });

    super.initState();
  }

  void _movePage() {
    if (currentPage.value == index) {
      activeScrollController = _scrollController;
      animate(0);
    } else {
      animate((index > currentPage.value ? 1 : 0));
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
    currentPage.removeListener(_movePage);
  }

  void animate(double animateTo) {
    _animation =
        Tween(
          begin: _animation.value,
          end: MediaQuery.of(context).size.width * (animateTo),
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );

    _animationController.reset();
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    int titleAlpha = 220;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_animation.value, 0),
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  widget.pageInfo.image,
                  alignment: (widget.pageInfo.imageAlignment != null)
                      ? widget.pageInfo.imageAlignment!
                      : Alignment.center,

                  fit: BoxFit.cover,
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 30, right: 20),
                alignment: Alignment.topRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.string(
                      KIcons.quoteIcon,
                      height: 50,
                      width: 50,
                      color: (widget.pageInfo.titleColor != null)
                          ? widget.pageInfo.titleColor!.withAlpha(titleAlpha)
                          : Colors.black.withAlpha(titleAlpha),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 250,
                          alignment: Alignment.centerRight,
                          child: FittedBox(
                            child: Text(
                              widget.pageInfo.title,
                              textAlign: TextAlign.right,
                              style: GoogleFonts.getFont(
                                color: (widget.pageInfo.titleColor != null)
                                    ? widget.pageInfo.titleColor!.withAlpha(
                                        titleAlpha,
                                      )
                                    : Colors.black.withAlpha(titleAlpha),
                                "Bodoni Moda",
                                fontSize: 50,
                                fontWeight: FontWeight.w700,
                                height: 1.2,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 350,
                          child: Text(
                            widget.pageInfo.description,
                            textAlign: TextAlign.right,
                            style: GoogleFonts.getFont(
                              color: (widget.pageInfo.titleColor != null)
                                  ? widget.pageInfo.titleColor!.withAlpha(
                                      titleAlpha,
                                    )
                                  : Colors.black.withAlpha(titleAlpha),
                              "Sora",
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SingleChildScrollView(
                controller: _scrollController,
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.75,
                ),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 40),
                  color: Colors.white,
                  child: Column(
                    children: [
                      ...List.generate(widget.pageInfo.textSections.length, (
                        index,
                      ) {
                        return TextSectionWidget(
                          textSection: widget.pageInfo.textSections.elementAt(
                            index,
                          ),
                          colorTheme: widget.pageInfo.colorTheme,
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
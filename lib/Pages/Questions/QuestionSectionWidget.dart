import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nation_identity_application/Pages/Questions/answer_option_widget.dart';
import 'package:nation_identity_application/Pages/Questions/completion_info_widget.dart';
import 'package:nation_identity_application/Pages/Questions/indicator_text_widget.dart';
import 'package:nation_identity_application/Pages/card_holder.dart';
import 'package:nation_identity_application/data.dart';
import 'dart:math';

class QuestionSectionWidget extends StatefulWidget {
  final List<Question> questions;
  final Color colorTheme;
  QuestionSectionWidget({
    super.key,
    required this.questions,
    required this.colorTheme,
  });

  @override
  State<QuestionSectionWidget> createState() => _QuestionSectionWidgetState();
}

class _QuestionSectionWidgetState extends State<QuestionSectionWidget>
    with TickerProviderStateMixin {
  final ValueNotifier<int> _currentQuestionIndex = ValueNotifier(0);
  final ValueNotifier<int?> _selected = ValueNotifier(null);

  List<AnimationController> progressControllers = [];
  int score = 0;

  @override
  void initState() {
    for (int i = 0; i < widget.questions.length; i++) {
      progressControllers.add(
        AnimationController(vsync: this, duration: Duration(milliseconds: 500)),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardHolder(
          child: ValueListenableBuilder(
            valueListenable: _currentQuestionIndex,
            builder: (context, value, child) {
              return AnimatedSwitcher(
                duration: Duration(milliseconds: 1000),
                switchInCurve: Curves.easeInOut,
                switchOutCurve: Curves.easeInOut,
                transitionBuilder: (child, animation) {
                  if (animation.isCompleted) {
                    animation.addListener(() {
                      print("Updating");
                      activeScrollController.animateTo(
                        activeScrollController.position.extentTotal,
                        duration: Duration(milliseconds: 1000),
                        curve: Curves.linear,
                      );
                    });
                  }

                  return SizeTransition(
                    sizeFactor: animation,
                    child: FadeTransition(opacity: animation, child: child),
                  );
                },
                child: (_currentQuestionIndex.value < widget.questions.length)
                    ? ValueListenableBuilder(
                        valueListenable: _selected,
                        builder: (context, value, child) {
                          Question currentQuestion =
                              (_currentQuestionIndex.value <
                                  widget.questions.length)
                              ? widget.questions.elementAt(
                                  _currentQuestionIndex.value,
                                )
                              : widget.questions.elementAt(
                                  widget.questions.length - 1,
                                );
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Progress indicator
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  children: [
                                    ...List.generate(widget.questions.length, (
                                      index,
                                    ) {
                                      AnimationController controller =
                                          progressControllers.elementAt(index);
                                      if (_currentQuestionIndex.value ==
                                          index) {
                                        if (_selected.value == null) {
                                          controller.reverse();
                                        } else {
                                          controller.animateTo(0.5);
                                        }
                                      } else if (_currentQuestionIndex.value >
                                          index) {
                                        controller.forward();
                                      }
                                      return Expanded(
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                            horizontal: 3,
                                          ),
                                          height: 5,
                                          child: AnimatedBuilder(
                                            animation: controller,
                                            builder: (context, child) {
                                              return LinearProgressIndicator(
                                                value: controller.value,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                backgroundColor: Color(
                                                  0x3C000000,
                                                ),
                                                color: Colors.black,
                                              );
                                            },
                                          ),
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                              ),
                              // Question
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 80),
                                child: Text(
                                  currentQuestion.question,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.getFont(
                                    "Roboto",
                                    color: Color(0xA7000000),
                                    fontSize: 15,
                                    height: 0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),

                              // Answers
                              ...List.generate(currentQuestion.options.length, (
                                index,
                              ) {
                                return AnswerOptionWidget(
                                  index: index,
                                  selected: _selected,
                                  color: widget.colorTheme,
                                  text: currentQuestion.options.elementAt(
                                    index,
                                  ),
                                );
                              }),

                              // Submit
                              GestureDetector(
                                onTap: () {
                                  if (_selected.value != null) {
                                    if (_selected.value ==
                                        currentQuestion.correctChoice) {
                                      score += 1;

                                      currentQuestion.isCorrect = true;
                                    } else {
                                      currentQuestion.isCorrect = false;
                                    }
                                    _selected.value = null;
                                    _currentQuestionIndex.value++;
                                    activeScrollController.animateTo(
                                      activeScrollController
                                          .position
                                          .extentTotal,
                                      duration: Duration(milliseconds: 750),
                                      curve: Curves.easeInOut,
                                    );
                                    setState(() {});
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: BoxBorder.all(
                                      color: widget.colorTheme,
                                    ),
                                  ),
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  padding: EdgeInsets.only(bottom: 6, top: 3),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: widget.colorTheme,
                                    ),
                                    width: double.infinity,
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      "Submit",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      )
                    : CompletionInfoWidget(
                        score: score,
                        length: widget.questions.length,
                        color: widget.colorTheme,
                      ),
              );
            },
          ),
        ),
        ...List.generate(widget.questions.length, (index) {
          Question currentQuestion = widget.questions.elementAt(index);
          return IndicatorTextWidget(currentQuestion: currentQuestion);
        }),
      ],
    );
  }
}
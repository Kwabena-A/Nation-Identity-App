import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nation_identity_application/Pages/card_holder.dart';
import 'package:nation_identity_application/data.dart';

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
    return CardHolder(
      child: ValueListenableBuilder(
        valueListenable: _currentQuestionIndex,
        builder: (context, value, child) {
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            transitionBuilder: (child, animation) {
              return SizeTransition(
                sizeFactor: CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOut,
                ),
                child: child,
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
                                  if (_currentQuestionIndex.value == index) {
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
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            backgroundColor: Color(0x3C000000),
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
                            return GestureDetector(
                              onTap: () {
                                _selected.value = (_selected.value == index)
                                    ? null
                                    : index;
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: BoxBorder.all(
                                    color: Color(0x22000000),
                                  ),
                                ),
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Text(
                                      currentQuestion.options.elementAt(index),
                                    ),
                                    Expanded(child: Container()),
                                    AnimatedSwitcher(
                                      transitionBuilder: (child, animation) =>
                                          FadeTransition(
                                            opacity:
                                                (child.key ==
                                                    ValueKey("Checked"))
                                                ? Tween<double>(
                                                    begin: 0.5,
                                                    end: 1.0,
                                                  ).animate(animation)
                                                : Tween<double>(
                                                    begin: 1.0,
                                                    end: 0.5,
                                                  ).animate(animation),
                                            child: child,
                                          ),
                                      duration: Duration(milliseconds: 50),
                                      child: (_selected.value == index)
                                          ? Icon(
                                              Icons.check_box,
                                              key: ValueKey("Checked"),
                                              size: 20,
                                              color: widget.colorTheme,
                                            )
                                          : Icon(
                                              key: ValueKey("Unchecked"),
                                              Icons.check_box_outline_blank,
                                              size: 20,
                                              color: Color(0x3C000000),
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),

                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: BoxBorder.all(color: widget.colorTheme),
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
                              child: GestureDetector(
                                onTap: () {
                                  if (_selected.value != null) {
                                    if (_selected.value ==
                                        currentQuestion.correctChoice) {
                                      score += 1;
                                      currentQuestion.isCorrect = true;
                                    }
                                    ;
                                    _selected.value = null;
                                    _currentQuestionIndex.value++;
                                  }
                                },
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
                : Column(
                    children: [
                      Container(
                        // Quiz Completed
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            CircularProgressIndicator(
                              value: score / widget.questions.length,
                              color: widget.colorTheme,
                            ),
                            Text(
                              "Your Scored: ${score / widget.questions.length * 100}%",
                              style: GoogleFonts.getFont(
                                "Montserrat",
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),

                      ...List.generate(widget.questions.length, (index) {
                        Question currentQuestion = widget.questions.elementAt(
                          index,
                        );
                        return CardHolder(
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  currentQuestion.question,
                                  softWrap: true,
                                ),
                              ),
                              Icon(
                                (currentQuestion.isCorrect == true)
                                    ? Icons.check
                                    : Icons.close,
                                color: (currentQuestion.isCorrect == true)
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
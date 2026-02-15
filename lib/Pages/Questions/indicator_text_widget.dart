import 'package:flutter/material.dart';
import 'package:nation_identity_application/data.dart';

import '../card_holder.dart';

class IndicatorTextWidget extends StatelessWidget {
  final Question currentQuestion;
  const IndicatorTextWidget({super.key, required this.currentQuestion});

  @override
  Widget build(BuildContext context) {
    return (currentQuestion.isCorrect != null)
        ? CardHolder(
            child: Container(
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      textAlign: TextAlign.center,
                      currentQuestion.question,
                      softWrap: true,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  SizedBox(width: 20),
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
            ),
          )
        : Container();
  }
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nation_identity_application/data.dart';

class QuestionSectionWidget extends StatelessWidget {
  final List<Question> questions;
  const QuestionSectionWidget({super.key, required this.questions});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Color(0x362D2D2D),
            offset: Offset(0, 2),
            blurRadius: 2,
          ),
        ],

        color: Colors.white,
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              ...List.generate(5, (index) {
                return Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    height: 5,
                    decoration: BoxDecoration(
                      color: Color(0x3C000000),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              }),
            ],
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 80),
            child: Text(
              questions.elementAt(0).question,
              style: GoogleFonts.getFont(
                "Roboto",
                color: Color(0xA7000000),
                fontSize: 15,
                height: 0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          ...List.generate(questions.elementAt(0).options.length, (index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: BoxBorder.all(color: Color(0x22000000)),
              ),
              width: double.infinity,
              child: Text(questions.elementAt(0).options.elementAt(index)),
            );
          }),
        ],
      ),
    );
  }
}
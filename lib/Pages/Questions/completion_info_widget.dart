import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CompletionInfoWidget extends StatelessWidget {
  final int score;
  final int length;
  final Color color;
  const CompletionInfoWidget({
    super.key,
    required this.score,
    required this.length,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "${(score / length * 100).round()}%",
          textAlign: TextAlign.center,
          style: GoogleFonts.getFont("Bebas Neue", fontSize: 60, height: 0),
        ),
        SizedBox(width: 5),
        Padding(
          padding: const EdgeInsets.only(bottom: 3.0),
          child: CircularProgressIndicator(
            backgroundColor: Color(0xFF000000),
            strokeWidth: 5,
            value: score / length,
            color: color,
          ),
        ),
      ],
    );
  }
}
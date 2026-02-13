import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nation_identity_application/data.dart';

class TextSectionWidget extends StatelessWidget {
  final Color colorTheme;
  final String title;
  final String subTitle;
  final List<String> texts;

  const TextSectionWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.texts,
    required this.colorTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 5,
                decoration: BoxDecoration(
                  color: Color(colorTheme.value),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.getFont(
                      "Bebas Neue",
                      color: Color(colorTheme.value),
                      fontSize: 30,
                      height: 0,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, -5),
                    child: Text(subTitle, style: TextStyle(height: 0)),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            height: 20,
            thickness: 2,
            endIndent: 20,
            indent: 20,
            color: Color(0xFFDBDBDB),
          ),

          ...List.generate(texts.length, (index) {
            return Row(
              children: [
                Container(
                  height: 5,
                  width: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: colorTheme,
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 2.5),
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Text(texts.elementAt(index)),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class AnswerOptionWidget extends StatefulWidget {
  final int index;
  final ValueNotifier selected;
  final String text;
  final Color color;
  const AnswerOptionWidget({
    super.key,
    required this.index,
    required this.selected,
    required this.text,
    required this.color,
  });

  @override
  State<AnswerOptionWidget> createState() => _AnswerOptionWidgetState();
}

class _AnswerOptionWidgetState extends State<AnswerOptionWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.selected.value = (widget.selected.value == widget.index)
            ? null
            : widget.index;
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: BoxBorder.all(color: Color(0x22000000)),
        ),
        child: Row(
          children: [
            Text(widget.text, style: TextStyle(fontSize: 12)),
            Expanded(child: Container()),
            AnimatedSwitcher(
              transitionBuilder: (child, animation) => FadeTransition(
                opacity: (child.key == ValueKey("Checked"))
                    ? Tween<double>(begin: 0.5, end: 1.0).animate(animation)
                    : Tween<double>(begin: 1.0, end: 0.5).animate(animation),
                child: child,
              ),
              duration: Duration(milliseconds: 50),
              child: (widget.selected.value == widget.index)
                  ? Icon(
                      Icons.check_box,
                      key: ValueKey("Checked"),
                      size: 20,
                      color: widget.color,
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
  }
}
import 'package:flutter/material.dart';

class UnderlineText extends StatelessWidget {
  const UnderlineText(
    this.text, {
    super.key,
    this.style,
    this.underlineThickness = 1,
    this.underlineHeight = 1,
    this.underlineColor = Colors.black,
  }) : assert(underlineHeight > 0);

  final String text;
  final TextStyle? style;
  final double underlineThickness;
  final double underlineHeight;
  final Color underlineColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: underlineHeight),
          child: Text(
            text,
            style: style,
          ),
        ),
        Positioned.fill(
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: underlineColor,
                  width: underlineThickness,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

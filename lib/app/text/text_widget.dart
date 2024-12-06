import 'package:flutter/material.dart';
import 'package:styled_text/tags/styled_text_tag_base.dart';
import 'package:styled_text/widgets/styled_text.dart';
import 'package:unipool/app/text/default_text_widget_tags.dart';
import 'package:unipool/app/text/special_char.dart';

final class TextWidget extends StatelessWidget {
  const TextWidget(
    this.styledText, {
    super.key,
    this.customTag = const {},
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.style,
    this.textDirection,
    this.customStyle,
    this.replaceEscapedChar = true,
  });

  final String styledText;
  final Map<String, StyledTextTagBase> customTag;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextStyle? style;
  final TextStyle? customStyle;
  final TextDirection? textDirection;
  final bool replaceEscapedChar;

  @override
  Widget build(BuildContext context) => StyledText(
        text: replaceEscapedChar
            ? styledText
                .replaceAll(
                  "&",
                  SpecialChar.escapedAmp,
                )
                .replaceAll(
                  "'",
                  SpecialChar.escapedApos,
                )
                .replaceAll(
                  '"',
                  SpecialChar.escapedQuote,
                )
            : styledText,
        tags: {...defaultTextWidgetTags, ...customTag},
        overflow: overflow,
        textAlign: textAlign,
        maxLines: maxLines,
        textScaleFactor: 1,
        textDirection: textDirection,
        style: style,
      );
}

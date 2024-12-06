import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:styled_text/tags/styled_text_tag.dart';
import 'package:styled_text/tags/styled_text_tag_base.dart';
import 'package:styled_text/tags/styled_text_tag_custom.dart';
import 'package:styled_text/tags/styled_text_tag_widget_builder.dart';
import 'package:styled_text/widgets/custom_styled_text.dart';
import 'package:unipool/app/extensions/build_context_extension.dart';
import 'package:unipool/app/text/custom_action_tag.dart';
import 'package:unipool/app/text/special_underline_widget.dart';
import 'package:unipool/core/constants/app_colors.dart';

/// text: 'Text with custom <color text="#ff5500">color</color> text.',
///text: 'Text with <link href="https://flutter.dev">link</link> inside.',// mostly custom
Map<String, StyledTextTagBase> defaultTextWidgetTags = {
  /// bold
  'b': StyledTextTag(style: const TextStyle(fontWeight: FontWeight.bold)),

  /// semi bold w500
  'sm': StyledTextTag(style: const TextStyle(fontWeight: FontWeight.bold)),

  /// large
  'l': StyledTextTag(style: const TextStyle(fontSize: 24)),

  /// italic
  'i': StyledTextTag(
    style: const TextStyle(fontStyle: FontStyle.italic),
  ),

  /// underline
  'u': StyledTextTag(
    style: const TextStyle(decoration: TextDecoration.underline, locale: Locale('en')),
  ),

  /// left to right string on specific text
  'ltr': StyledTextWidgetBuilderTag(
    (context, attributes, textContent) {
      final widget = (context.widget as CustomStyledText);
      final startIndex = widget.text.indexOf('<ltr>');
      final endIndex = widget.text.indexOf('</ltr>');
      final text = widget.text.substring(startIndex + '<ltr>'.length, endIndex);
      return Text(
        text,
        textDirection: TextDirection.ltr,
        style: widget.style,
      );
    },
  ),

  /// special underline
  'su': StyledTextWidgetBuilderTag(
    (context, attributes, textContent) {
      final widget = (context.widget as CustomStyledText);
      final startIndex = widget.text.indexOf('<su>');
      final endIndex = widget.text.indexOf('</su>');
      final text = widget.text.substring(startIndex + '<su>'.length, endIndex);
      return GestureDetector(
        onTap: (widget.tags.isNotEmpty && widget.tags.containsKey('suLink'))
            ? () {
                (widget.tags['suLink'] as NoAttributesNoTextActionTag).onTap.call();
              }
            : null,
        child: UnderlineText(
          text,
          style: widget.style,
        ),
      );
    },
  ),

  /// clickable color
  'cc': StyledTextWidgetBuilderTag(
    (context, attributes, textContent) {
      final widget = (context.widget as CustomStyledText);
      final startIndex = widget.text.indexOf('<cc>');
      final endIndex = widget.text.indexOf('</cc>');
      final text = widget.text.substring(startIndex + '<cc>'.length, endIndex);
      return GestureDetector(
        onTap: (widget.tags.isNotEmpty && widget.tags.containsKey('ccLink'))
            ? () {
                (widget.tags['ccLink'] as NoAttributesNoTextActionTag).onTap.call();
              }
            : null,
        child: Text(
          text,
          style: (widget.tags.isNotEmpty && widget.tags.containsKey('ccLink'))
              ? context.textTheme.bodyMedium!.copyWith(
                  color: AppColors.kPrimary100,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                )
              : widget.style,
        ),
      );
    },
  ),

  /// color
  'color': StyledTextCustomTag(
    baseStyle: const TextStyle(fontStyle: FontStyle.normal),
    parse: (baseStyle, attributes) {
      if (attributes.containsKey('text') &&
          (attributes['text']!.substring(0, 1) == '#') &&
          attributes['text']!.length >= 6) {
        final hexColor = attributes['text']!.substring(1);
        final alphaChannel = (hexColor.length == 8) ? hexColor.substring(6, 8) : 'FF';
        final color = Color(int.parse('0x$alphaChannel${hexColor.substring(0, 6)}'));
        return baseStyle!.copyWith(color: color);
      } else {
        return baseStyle;
      }
    },
  ),
};

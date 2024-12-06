import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:styled_text/tags/styled_text_tag.dart';

class NoAttributesNoTextActionTag extends StyledTextTag {
  final VoidCallback onTap;

  NoAttributesNoTextActionTag(
    this.onTap,
  ) : super();

  @override
  GestureRecognizer? createRecognizer(String? text, Map<String?, String?> attributes) {
    return null;
  }
}

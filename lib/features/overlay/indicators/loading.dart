library loading;

import 'package:flutter/material.dart';
import 'package:unipool/features/overlay/indicators/ball_rotate.dart';
import 'package:unipool/features/overlay/indicators/ball_rotate_pulse.dart';
import 'package:unipool/features/overlay/controller/decorate.dart';

///34 different types animation enums.
enum Indicator {
  ballClipRotatePulse,
  ballRotate,
}

/// Entrance of the loading.
class LoadingIndicator extends StatelessWidget {
  /// Indicate which type.
  final Indicator indicatorType;

  /// The color you draw on the shape.
  final List<Color>? colors;
  final Color? backgroundColor;

  /// The stroke width of line.
  final double? strokeWidth;

  /// Applicable to which has cut edge of the shape
  final Color? pathBackgroundColor;

  /// Animation status, true will pause the animation, default is false
  final bool pause;

  const LoadingIndicator({
    Key? key,
    required this.indicatorType,
    this.colors,
    this.backgroundColor,
    this.strokeWidth,
    this.pathBackgroundColor,
    this.pause = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final safeColors = colors == null || colors!.isEmpty ? [Theme.of(context).primaryColor] : colors!;
    return DecorateContext(
      decorateData: DecorateData(
        indicator: indicatorType,
        colors: safeColors,
        strokeWidth: strokeWidth,
        pathBackgroundColor: pathBackgroundColor,
        pause: pause,
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          color: backgroundColor,
          child: _buildIndicator(),
        ),
      ),
    );
  }

  /// return the animation indicator.
  _buildIndicator() {
    switch (indicatorType) {
      case Indicator.ballClipRotatePulse:
        return const BallClipRotatePulse();
      case Indicator.ballRotate:
        return const BallRotate();
      default:
        throw Exception("no related indicator type:$indicatorType found");
    }
  }
}

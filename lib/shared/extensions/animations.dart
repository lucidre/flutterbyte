import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutterbyte/common_libs.dart';
import 'package:flutterbyte/shared/widgets/hover_container.dart';

extension WidgetAnimation on Widget {
  Widget hover([double hoverScale = 1.1]) => HoverContainer(
        hoverScale: hoverScale,
        child: this,
      );

  Widget fadeInAndMoveFromTop({
    Duration? delay,
    Duration? animationDuration,
    Offset? offset,
  }) =>
      animate(delay: delay ?? medDuration)
          .move(
              duration: animationDuration ?? medDuration,
              begin: offset ?? const Offset(0, -10))
          .fade(duration: animationDuration ?? medDuration);

  Widget fadeInAndMoveFromBottom({
    Duration? delay,
    Duration? animationDuration,
    Offset? offset,
  }) =>
      animate(delay: delay ?? medDuration)
          .move(
              duration: animationDuration ?? medDuration,
              begin: offset ?? const Offset(0, 10))
          .fade(duration: animationDuration ?? medDuration);

  Widget fadeIn({
    Duration? delay,
    Duration? animationDuration,
    Curve? curve,
  }) =>
      animate(delay: delay ?? medDuration).fade(
          duration: animationDuration ?? medDuration,
          curve: curve ?? Curves.decelerate);
}

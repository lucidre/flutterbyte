import 'package:flutterbyte/common_libs.dart';

/// Utility class that wraps a normal [Hero] widget, but respects WonderIllustrationConfig.enableHero setting
class AppHero extends StatelessWidget {
  const AppHero({
    super.key,
    required this.tag,
    required this.child,
    this.enableHero = true,
  });

  final Widget child;
  final bool enableHero;
  final String tag;

  @override
  Widget build(BuildContext context) => enableHero
      ? Hero(
          createRectTween: (begin, end) => RectTween(begin: begin!, end: end!),
          tag: tag,
          child: child,
        )
      : child;
}

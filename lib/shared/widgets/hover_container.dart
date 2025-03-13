import 'package:flutter/material.dart';
import 'package:flutterbyte/shared/constants/duration.dart';

class HoverContainer extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double hoverScale;
  const HoverContainer({
    super.key,
    required this.child,
    this.onTap,
    this.hoverScale = 1.1,
  });

  @override
  State<HoverContainer> createState() => _HoverContainerState();
}

class _HoverContainerState extends State<HoverContainer> {
  final hoverValueNotifier = ValueNotifier<bool>(false);

  onHover(bool value) {
    final hoverValue = hoverValueNotifier.value;
    if (value && !hoverValue) {
      hoverValueNotifier.value = true;
    } else if (!value && hoverValue) {
      hoverValueNotifier.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onHover: (value) => onHover(value),
      onTap: () => widget.onTap?.call(),
      child: buildBody(),
    );
  }

  buildBody() {
    return ValueListenableBuilder<bool>(
        valueListenable: hoverValueNotifier,
        builder: (_, hovered, child) {
          return TweenAnimationBuilder<double>(
            tween: Tween(end: hovered ? widget.hoverScale : 1.0),
            curve: Curves.easeIn,
            duration: fastDuration,
            child: widget.child,
            builder: (_, value, child) {
              return Transform.scale(
                scale: value,
                child: child,
              );
            },
          );
        });
  }
}

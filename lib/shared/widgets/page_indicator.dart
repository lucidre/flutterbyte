import 'package:flutterbyte/common_libs.dart';

class AppPageIndicator extends StatefulWidget {
  final int count;
  final PageController controller;
  final bool useRemainderFactor;
  final double? opacity;

  const AppPageIndicator({
    super.key,
    required this.count,
    required this.controller,
    this.useRemainderFactor = false,
    this.opacity,
  });

  @override
  State<AppPageIndicator> createState() => _AppPageIndicatorState();
}

class _AppPageIndicatorState extends State<AppPageIndicator> {
  final currentPage = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_handlePageChanged);
  }

  void _handlePageChanged() {
    final page = widget.controller.page?.round() ?? 0;
    if (widget.useRemainderFactor) {
      currentPage.value = page % widget.count;
    } else {
      currentPage.value = page;
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = [];
    for (var i = 0; i < widget.count; i++) {
      data.add(i);
    }
    return ValueListenableBuilder<int>(
      valueListenable: currentPage,
      builder: (_, value, child) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: data
              .map(
                (item) => buildIndicator(
                  data.indexOf(item) == (value),
                ),
              )
              .toList(),
        );
      },
    ).fadeIn();
  }

  Widget buildIndicator(bool isSelected) {
    return TweenAnimationBuilder<double>(
        tween: Tween(end: isSelected ? 1 : 0),
        curve: Curves.easeIn,
        duration: fastDuration,
        builder: (context, value, _) {
          return AnimatedContainer(
            duration: fastDuration,
            width: 6 + (value * 50),
            height: 6,
            margin: const EdgeInsets.only(
              left: space6,
              right: space6,
            ),
            decoration: BoxDecoration(
              color: Color.lerp(
                whiteColor.withOpacity(widget.opacity ?? .8),
                whiteColor,
                value,
              ),
              borderRadius: BorderRadius.circular(space12),
            ),
          );
        });
  }
}

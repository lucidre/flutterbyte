import 'package:flutter/material.dart';

class SizeSwitcher extends StatelessWidget {
  final Widget? smallScreen;
  final Widget? mediumScreen;
  final Widget? largeScreen;

  const SizeSwitcher({
    super.key,
    this.smallScreen,
    this.mediumScreen,
    this.largeScreen,
  });

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return smallScreen ??
          mediumScreen ??
          largeScreen ??
          const SizedBox.shrink();
    } else if (screenWidth >= 600 && screenWidth < 1200) {
      return mediumScreen ?? largeScreen ?? const SizedBox.shrink();
    } else {
      return largeScreen ?? const SizedBox.shrink();
    }
  }
}

import 'package:flutterbyte/common_libs.dart';

extension DeviceBar on BuildContext {
  Future<T?> showBottomBar<T>({
    required Widget child,
    double? height,
    bool dismissable = true,
    bool ignoreHeight = true,
    bool ignoreBg = true,
  }) {
    final defaultHeight = screenHeight - (top + kToolbarHeight * 2);

    final result = showModalBottomSheet<T>(
      context: this,
      isScrollControlled: true,
      isDismissible: dismissable,
      backgroundColor: Colors.transparent,
      constraints: BoxConstraints(maxHeight: height ?? defaultHeight),
      builder: (_) => Material(
        color: Colors.transparent,
        child: Container(
          height: ignoreHeight ? null : height,
          color: ignoreBg == true ? null : backgroundColor,
          child: child.fadeInAndMoveFromBottom(),
        ),
      ),
    );
    return result;
  }

  Future<T?> $showGeneralDialog<T>({
    required Widget child,
    required String barrierLabel,
    bool dismissible = true,
  }) {
    return showGeneralDialog<T>(
      context: this,
      barrierDismissible: dismissible,
      barrierLabel: barrierLabel,
      barrierColor: neutral800.withOpacity(0.5),
      transitionDuration: fastDuration,
      pageBuilder: (_, __, ___) => Dialog(
        backgroundColor: backgroundColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(space4),
        )),
        elevation: 3,
        child: child.fadeInAndMoveFromBottom(),
      ),
      transitionBuilder: (_, anim, __, child) => FadeTransition(
        opacity: Tween(begin: 0.0, end: 1.0).animate(anim),
        child: child,
      ),
    );
  }

  Widget buildLoadingWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        verticalSpacer8,
        Transform.scale(
          scale: 1.2,
          child: Lottie.asset(
            loadingLottie,
            animate: true,
            repeat: true,
            reverse: true,
            width: 250,
            height: 250,
            fit: BoxFit.contain,
          ),
        ),
        Text(
          'Fetching data, Kindly wait.',
          style: abel500S14,
        ).fadeInAndMoveFromBottom(),
      ],
    );
  }

  Widget buildErrorWidget(
      {String? title,
      String? body,
      String? button,
      bool isMini = false,
      required VoidCallback onRetry}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: isMini ? MainAxisSize.min : MainAxisSize.max,
      children: [
        if (isMini) verticalSpacer8,
        Transform.scale(
          scale: isMini ? 1 : 1.2,
          child: Lottie.asset(
            errorLottie,
            animate: true,
            repeat: true,
            reverse: true,
            width: 250,
            height: 250,
            fit: BoxFit.contain,
          ),
        ),
        verticalSpacer12,
        Text(
          title ?? 'Error Occurred',
          style: abel600S20,
        ).fadeInAndMoveFromBottom(),
        verticalSpacer8,
        Text(
          body ?? 'An error occurred with the data fetch, Kindly try again.',
          style: abel500S14,
        ).fadeInAndMoveFromBottom(),
        verticalSpacer16,
        AppBtn.from(
          onPressed: () {
            onRetry();
          },
          isSecondary: $isDarkMode,
          text: button ?? 'Retry',
        ),
        if (isMini) verticalSpacer8
      ],
    );
  }

  Widget buildNoDataWidget(
      {String? lottie, String? title, String? body, bool isMini = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: isMini ? MainAxisSize.min : MainAxisSize.max,
      children: [
        const SizedBox(width: double.infinity),
        if (isMini) verticalSpacer8,
        Transform.scale(
          scale: isMini ? 1 : 1.2,
          child: Lottie.asset(
            lottie ?? noDataLottie,
            animate: true,
            repeat: true,
            reverse: true,
            width: 250,
            height: 250,
            fit: BoxFit.contain,
          ),
        ).fadeInAndMoveFromBottom(),
        verticalSpacer8,
        Text(
          title ?? 'No Data',
          style: abel600S20,
        ).fadeInAndMoveFromBottom(),
        Text(
          body ?? 'There is currently no data to display.',
          style: abel500S14,
          textAlign: TextAlign.center,
        ).fadeInAndMoveFromBottom(),
        if (isMini) verticalSpacer32
      ],
    );
  }
}

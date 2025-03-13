import 'dart:math';

import 'package:flutterbyte/common_libs.dart';

class ConferenceStripe extends StatefulWidget {
  final bool isFlipped;
  const ConferenceStripe({super.key, required this.isFlipped});

  @override
  State<ConferenceStripe> createState() => _ConferenceStripeState();
}

class _ConferenceStripeState extends State<ConferenceStripe> {
  final widgets = List.generate(
    50,
    (_) => [
      horizontalSpacer12,
      Text(
        'FlutterBytes Conference 2024',
        style: abel700S14.copyWith(color: whiteColor),
      ),
      horizontalSpacer12,
      const Icon(Icons.star_rounded, color: whiteColor),
      horizontalSpacer12,
    ],
  ).expand((x) => x).toList();

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: (widget.isFlipped ? -1 : 1) * pi / 80,
      origin: const Offset(-100, 0),
      child: buildBody(),
    );
  }

  Container buildBody() {
    return Container(
      padding: const EdgeInsets.all(space6),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: stripGradient),
        border: Border.all(color: whiteColor.withOpacity(.4)),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: widgets.map((widget) => widget.fadeIn()).toList(),
        ),
      ),
    );
  }
}

// ignore_for_file: use_build_context_synchronously

import 'package:flutterbyte/common_libs.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: space12,
        bottom: space12,
        right: space24,
        left: space24,
      ),
      decoration: BoxDecoration(
        color: blueBackground,
        border: Border.all(color: whiteColor),
        borderRadius: BorderRadius.circular(space12),
      ),
      child: buildBody(),
    );
  }

  Row buildBody() {
    return Row(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Image.asset(
            logoW,
            width: 50,
            height: 50,
          ),
        ),
        horizontalSpacer8,
        buildName().fadeInAndMoveFromBottom(),
        const Spacer(),
        buildDivider().fadeIn(),
        horizontalSpacer24,
        buildTextItem1().fadeInAndMoveFromBottom(),
        horizontalSpacer24,
        buildDivider().fadeIn(),
        horizontalSpacer24,
        buildTextitem2().fadeInAndMoveFromBottom(),
      ],
    );
  }

  Column buildTextitem2() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {},
          child: Text(
            'Event Agenda',
            style: abel500S14.copyWith(color: whiteColor),
          ),
        ),
        verticalSpacer12,
        GestureDetector(
          onTap: () {},
          child: Text(
            'Gallery & Testimonials',
            style: abel500S14.copyWith(color: whiteColor),
          ),
        ),
        verticalSpacer12,
        GestureDetector(
          onTap: () {},
          child: Text(
            'Speakers',
            style: abel500S14.copyWith(color: whiteColor),
          ),
        ),
        verticalSpacer12,
        GestureDetector(
          onTap: () {},
          child: Text(
            'Organizing committee',
            style: abel500S14.copyWith(color: whiteColor),
          ),
        ),
      ],
    );
  }

  Column buildTextItem1() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {},
          child: Text(
            'Apply to speak',
            style: abel500S14.copyWith(color: whiteColor),
          ),
        ),
        verticalSpacer12,
        GestureDetector(
          onTap: () {},
          child: Text(
            'Apply to volunteer',
            style: abel500S14.copyWith(color: whiteColor),
          ),
        ),
        verticalSpacer12,
        GestureDetector(
          onTap: () {},
          child: Text(
            'FlutterBytes Hackathon',
            style: abel500S14.copyWith(color: whiteColor),
          ),
        ),
        verticalSpacer12,
        GestureDetector(
          onTap: () {},
          child: Text(
            'Hackathon Submission',
            style: abel500S14.copyWith(color: whiteColor),
          ),
        ),
      ],
    );
  }

  Container buildDivider() {
    return Container(
      width: 1,
      height: 160,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(space16),
      ),
    );
  }

  Column buildName() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'FlutterBytes',
          style: abel700S24.copyWith(
            color: whiteColor,
            fontSize: 28,
            letterSpacing: 2,
            height: 1,
          ),
        ),
        Text(
          'CONFERENCE',
          style: abel600S12.copyWith(
            color: whiteColor,
            letterSpacing: 2,
          ),
        ),
      ],
    );
  }
}

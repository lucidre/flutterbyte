// ignore_for_file: use_build_context_synchronously

import 'package:flutterbyte/common_libs.dart';
import 'package:flutterbyte/features/home/data/model/speaker/speaker.dart';
import 'package:flutterbyte/features/home/presentation/pages/home_speaker_item.dart';

class SpeakerLineUp extends StatelessWidget {
  const SpeakerLineUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Speaker ',
            style: abel700S32.copyWith(
              fontSize: 45,
              color: blueBackground,
            ),
          ),
          Text(
            'Lineup',
            style: abel700S32.copyWith(
              fontSize: 45,
              color: whiteColor,
              height: 1,
            ),
          ),
        ],
      ).fadeInAndMoveFromBottom(),
      verticalSpacer12,
      SizedBox(
        width: 1300,
        child: Text(
          "Get ready for an incredible lineup at FlutterByte, the premier conference for Flutter enthusiasts and developers! Our speakers are experts in Flutter, each bringing unique insights, innovative ideas, and in-depth knowledge from years of experience. Whether you’re a seasoned developer or just starting with Flutter, these sessions will inspire you, challenge you, and provide you with valuable tools to elevate your skills.",
          style: abel500S16.copyWith(
            color: whiteColor,
          ),
          textAlign: TextAlign.center,
        ),
      ).fadeInAndMoveFromBottom(),
      verticalSpacer24,
      Row(
        children: speakers1
            .map(
              (speaker) => Expanded(child: HomeSpeakerItem(model: speaker)),
            )
            .toList(),
      ),
      Row(
        children: speakers2
            .map(
              (speaker) => Expanded(child: HomeSpeakerItem(model: speaker)),
            )
            .toList(),
      ),
      Row(
        children: speakers3
            .map(
              (speaker) => Expanded(child: HomeSpeakerItem(model: speaker)),
            )
            .toList(),
      ),
      Row(
        children: speakers4
            .map(
              (speaker) => Expanded(child: HomeSpeakerItem(model: speaker)),
            )
            .toList(),
      ),
      Row(
        children: speakers5
            .map(
              (speaker) => Expanded(child: HomeSpeakerItem(model: speaker)),
            )
            .toList(),
      ),
    ]);
  }
}

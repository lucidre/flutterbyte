import 'package:flutterbyte/common_libs.dart';
import 'package:flutterbyte/features/home/data/model/speaker/speaker.dart';

class HomeSpeakerItem extends StatelessWidget {
  final SpeakerModel model;
  const HomeSpeakerItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(space12),
      padding: const EdgeInsets.all(space12),
      decoration: BoxDecoration(
        color: blackColor.withOpacity(.8),
        borderRadius: BorderRadius.circular(space12),
        border: Border.all(color: whiteColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          buildImage().fadeInAndMoveFromBottom(),
          verticalSpacer16,
          buildSpeakerName(context).fadeInAndMoveFromBottom(),
          verticalSpacer4,
          Text(
            model.role,
            style: abel500S16.copyWith(color: whiteColor),
            maxLines: 1,
          ),
        ],
      ),
    ).hover(1.05).fadeInAndMoveFromBottom();
  }

  RichText buildSpeakerName(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: '${model.firstName} ',
          style: abel700S24.copyWith(
            color: blueBackground,
            fontSize: 22,
            height: 1,
          ),
        ),
        TextSpan(
          text: model.secondName,
          style: abel700S24.copyWith(
            color: whiteColor,
            height: 1,
            fontSize: 22,
          ),
        )
      ], style: abel500S14),
      textAlign: TextAlign.center,
      textScaler: MediaQuery.of(context).textScaler,
    );
  }

  AspectRatio buildImage() {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(space12),
        ),
        child: Image.asset(
          model.image,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

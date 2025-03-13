import 'package:flutterbyte/common_libs.dart';
import 'package:flutterbyte/features/home/data/model/committee/committee.dart';

class OrganizingCommitteeItem extends StatelessWidget {
  final CommitteeMemeberModel model;
  const OrganizingCommitteeItem(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: buildImage().fadeInAndMoveFromBottom()),
        verticalSpacer24,
        buildName(context).fadeInAndMoveFromBottom(),
        verticalSpacer4,
        Text(
          model.role,
          style: abel500S16.copyWith(
            color: whiteColor,
          ),
        ),
      ],
    );
  }

  RichText buildName(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: '${model.firstName} ',
          style: abel700S24.copyWith(
            color: blueBackground,
            fontSize: 26,
            height: 1,
          ),
        ),
        TextSpan(
          text: model.secondName,
          style: abel700S24.copyWith(
            color: whiteColor,
            height: 1,
            fontSize: 26,
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
        padding: const EdgeInsets.all(3),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: whiteColor,
        ),
        child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            model.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

import 'package:flutterbyte/common_libs.dart';
import 'package:flutterbyte/features/home/data/model/home_button/home_button.dart';
import 'package:flutterbyte/features/home/presentation/controller/home_controller.dart';
import 'package:flutterbyte/features/home/presentation/pages/conference_description.dart';
import 'package:flutterbyte/features/home/presentation/pages/conference_description_images.dart';
import 'package:flutterbyte/features/home/presentation/widget/home_title_button_item.dart';

class AppTitle extends StatefulWidget {
  const AppTitle({super.key});

  @override
  State<AppTitle> createState() => _AppTitleState();
}

class _AppTitleState extends State<AppTitle> {
  HomeButtonModel? previousButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        verticalSpacer32 * 2,
        buildTitle().hover().fadeInAndMoveFromBottom(),
        verticalSpacer12,
        ...buildTitleText(),
        verticalSpacer32 * 1.5,
        buttonWidget(),
        verticalSpacer24,
        buttonControlledWidget(),
      ],
    );
  }

  List<Widget> buildTitleText() {
    return [
      Text(
        'The Global Impact Of African Flutter Engineers',
        style: abel700S24.copyWith(
          color: const Color(0xFFBCC5CC),
        ),
      ).fadeInAndMoveFromBottom(),
      verticalSpacer12,
      Container(
        width: 900,
        height: 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(space16),
          gradient: const LinearGradient(colors: homeLineGradient),
        ),
      ).fadeIn(),
      verticalSpacer12,
      Text(
        '{FlutterBytes Conference 2024}',
        style: abel700S32.copyWith(color: const Color(0xFFBCC5CC)),
      ).fadeInAndMoveFromBottom(),
    ];
  }

  Stack buildTitle() {
    return Stack(
      children: [
        Positioned(
          top: 30,
          left: 268,
          child: Container(
            height: 182,
            width: 182,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Image.asset(
              largeGlobe,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
        ),
        Image.asset(
          beyondBordersTextDark,
          width: 837,
          alignment: Alignment.topCenter,
        ),
      ],
    );
  }

  Widget buttonWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: buttonModels
          .map((model) => HomeTitleButtonItem(model: model))
          .toList(),
    ).fadeInAndMoveFromBottom();
  }

  Widget buttonControlledWidget() {
    return GetX<HomeController>(builder: (controller) {
      final currentButton = controller.homeButton;
      final tween = Tween(end: currentButton != previousButton ? 1.0 : 0.0);
      const easeIn = Curves.easeIn;

      return TweenAnimationBuilder<double>(
        tween: tween,
        curve: easeIn,
        duration: fastDuration,
        onEnd: () {
          // previous is not kept in the controller to prevent getx from rebuilding when it is changed. We only need it here.
          previousButton = controller.homeButton;
        },
        builder: (_, value, child) {
          final color = Color.lerp(
                previousButton?.color ?? whiteColor,
                currentButton.color,
                value,
              ) ??
              whiteColor;
          return Container(
            height: 800,
            width: 1400,
            padding: const EdgeInsets.all(space12),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: color,
              ),
              borderRadius: BorderRadius.circular(space12),
            ),
            child: Row(
              children: [
                Expanded(child: buildConferenceDescription(color)),
                horizontalSpacer12,
                buildConferenceDescriptionImages(color),
              ],
            ),
          );
        },
      );
    });
  }

  Container buildConferenceDescription(Color color) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(space12),
        border: Border.all(
          color: color,
          width: 2,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
      ),
      child: const ConferenceDescription(),
    );
  }

  Container buildConferenceDescriptionImages(Color color) {
    return Container(
      width: 350,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(space12),
        border: Border.all(
          color: color,
          width: 2,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
      ),
      child: const ConferenceDescriptionImages(),
    );
  }
}

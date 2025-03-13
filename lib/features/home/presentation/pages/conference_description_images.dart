import 'package:flutter/cupertino.dart';
import 'package:flutterbyte/common_libs.dart';
import 'package:flutterbyte/features/home/data/model/home_button/home_button.dart';
import 'package:flutterbyte/features/home/presentation/controller/home_controller.dart';

class ConferenceDescriptionImages extends StatefulWidget {
  const ConferenceDescriptionImages({super.key});

  @override
  State<ConferenceDescriptionImages> createState() =>
      _ConferenceDescriptionImagesState();
}

class _ConferenceDescriptionImagesState
    extends State<ConferenceDescriptionImages> with TickerProviderStateMixin {
  late StreamController<SlideUpdate> slideUpdateStream;
  late AnimatedPageDragger animatedPageDragger;

  int activePageIndex = 0; //active page index
  int nextPageIndex = 0; //next page index

  double slidePercent = 0.0; //slide percentage (0.0 to 1.0)
  late StreamSubscription<SlideUpdate> slideUpdateStream$;

  startAnimation(HomeButtonModel model) async {
    int index = model == buttonModels[0]
        ? 0
        : model == buttonModels[1]
            ? 1
            : 2;

    slideUpdateStream.add(SlideUpdate(0.0, UpdateType.doneDragging, index));
  }

  @override
  void initState() {
    final controller = Get.find<HomeController>();
    controller.homeButtonRx.listen(
      (_) => startAnimation(controller.homeButton),
    );

    slideUpdateStream = StreamController<SlideUpdate>();

    slideUpdateStream$ = slideUpdateStream.stream.listen((SlideUpdate event) {
      slidePercent = event.slidePercent;
      nextPageIndex = event.nextPage;

      //if the user is done dragging
      if (event.updateType == UpdateType.doneDragging) {
        //Auto completion of event using Animated page dragger.
        animatedPageDragger = AnimatedPageDragger(
            transitionGoal: TransitionGoal.open,
            slidePercent: slidePercent,
            slideUpdate: event,
            slideUpdateStream: slideUpdateStream,
            vsync: this);

        animatedPageDragger.run();
      }
      //when animating
      else if (event.updateType == UpdateType.animating) {
        slidePercent = event.slidePercent;
      }
      //done animating
      else if (event.updateType == UpdateType.doneAnimating) {
        activePageIndex = nextPageIndex;
        slidePercent = 0.0;
      }

      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    slideUpdateStream$.cancel();
    animatedPageDragger.dispose();
    slideUpdateStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final widget = activePageIndex == 0
        ? buildAboutUs()
        : activePageIndex == 1
            ? buildSchedule()
            : buildLocation();

    final widget2 = nextPageIndex == 0
        ? buildAboutUs()
        : nextPageIndex == 1
            ? buildSchedule()
            : buildLocation();

    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 1 - slidePercent,
          child: widget,
        ),
        PageReveal(
          revealPercent: slidePercent,
          child: Opacity(
            opacity: slidePercent,
            child: widget2,
          ),
        ),
      ], //Widget
    );
  }

  Widget buildAboutUs() {
    return Stack(
      children: [
        Container(
          color: blueBackground,
          height: double.infinity,
          width: double.infinity,
        ),
        Image.asset(
          pattern,
          height: double.infinity,
          fit: BoxFit.fitHeight,
        ),
        Container(
          padding: const EdgeInsets.all(space16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpacer32,
              Row(
                children: [
                  const Icon(
                    CupertinoIcons.calendar,
                    color: whiteColor,
                  ),
                  horizontalSpacer12,
                  Text(
                    'A 2-day Event',
                    style: abel700S24.copyWith(color: whiteColor),
                  ),
                ],
              ),
              verticalSpacer12,
              Text(
                'Friday and Saturday, November 1st-2nd, 2024.',
                style: abel700S32.copyWith(
                  color: whiteColor,
                  fontSize: 40,
                ),
              ),
              verticalSpacer12,
              Container(
                padding: const EdgeInsets.all(space8),
                decoration: BoxDecoration(
                  border: Border.all(color: whiteColor, width: 2),
                  borderRadius: BorderRadius.circular(space12),
                ),
                child: Text(
                  '8:00AM on both days',
                  style: abel700S24.copyWith(color: whiteColor),
                ),
              ),
            ],
          ).fadeInAndMoveFromBottom(),
        ),
      ],
    );
  }

  Widget buildSchedule() {
    return Stack(
      children: [
        Image.asset(
          statBg,
          height: double.infinity,
          fit: BoxFit.fitHeight,
        ),
        Container(
          padding: const EdgeInsets.all(space16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: double.infinity),
              Text(
                '16',
                style: abel700S32.copyWith(
                  color: whiteColor,
                  fontSize: 50,
                ),
              ),
              Text(
                'Speakers',
                style: abel500S24.copyWith(color: whiteColor),
              ),
              verticalSpacer24,
              Text(
                '500',
                style: abel700S32.copyWith(
                  color: whiteColor,
                  fontSize: 50,
                ),
              ),
              Text(
                'Flutter Dev',
                style: abel500S24.copyWith(color: whiteColor),
              ),
              verticalSpacer24,
              Text(
                '12+',
                style: abel700S32.copyWith(
                  color: whiteColor,
                  fontSize: 50,
                ),
              ),
              Text(
                'Sessions',
                style: abel500S24.copyWith(color: whiteColor),
              ),
              verticalSpacer24,
              Text(
                '02',
                style: abel700S32.copyWith(
                  color: whiteColor,
                  fontSize: 50,
                ),
              ),
              Text(
                'Days',
                style: abel500S24.copyWith(color: whiteColor),
              ),
            ],
          ),
        ).fadeInAndMoveFromBottom(),
      ],
    );
  }

  Widget buildLocation() {
    return Stack(
      children: [
        Container(
          color: const Color(0xFFD0EFFF),
          height: double.infinity,
          width: double.infinity,
        ),
        Image.asset(
          pattern,
          height: double.infinity,
          fit: BoxFit.fitHeight,
        ),
        Container(
          padding: const EdgeInsets.all(space16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(space12),
                      border: Border.all(
                        color: blackColor,
                        width: 2,
                        strokeAlign: BorderSide.strokeAlignOutside,
                      )),
                  child: Image.asset(
                    fun,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              verticalSpacer32,
              Text(
                "Don't miss out on the fun!",
                style: abel700S24.copyWith(
                  color: blackColor,
                  fontSize: 50,
                  height: 1,
                ),
              ),
              verticalSpacer16,
              Container(
                padding: const EdgeInsets.all(space12),
                decoration: BoxDecoration(
                  color: blueBackground,
                  borderRadius: BorderRadius.circular(space12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(CupertinoIcons.tickets, color: whiteColor),
                    horizontalSpacer12,
                    Text(
                      'Pick Up a Ticket!',
                      style: abel500S16.copyWith(color: whiteColor),
                    ),
                    horizontalSpacer12,
                    const Icon(
                      Icons.arrow_right_alt_rounded,
                      color: whiteColor,
                    )
                  ],
                ),
              ),
            ],
          ).fadeInAndMoveFromBottom(),
        ),
      ],
    );
  }
}

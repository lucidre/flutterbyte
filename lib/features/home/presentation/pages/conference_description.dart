import 'dart:math';
import 'package:flutterbyte/common_libs.dart';
import 'package:flutterbyte/features/home/data/model/home_button/home_button.dart';
import 'package:flutterbyte/features/home/presentation/controller/home_controller.dart';

class ConferenceDescription extends StatefulWidget {
  const ConferenceDescription({super.key});

  @override
  State<ConferenceDescription> createState() => _ConferenceDescriptionState();
}

class _ConferenceDescriptionState extends State<ConferenceDescription>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> _animation;
  int index = 0;

  @override
  void initState() {
    controller = AnimationController(duration: fastDuration, vsync: this);

    _animation = Tween<double>(begin: 0.0, end: 40.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );

    controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        final text = Get.find<HomeController>().homeButton;
        index = text == buttonModels[0]
            ? 0
            : text == buttonModels[1]
                ? 1
                : 2;
        setState(() {});
        controller.reverse();
      }
    });

    Get.find<HomeController>().homeButtonRx.listen((_) {
      if (controller.isAnimating) {
        controller.reset();
      }
      controller.forward();
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0.0, _animation.value),
          child: Opacity(
            opacity: min(1, 1 - controller.value),
            child: index == 0
                ? buildAboutUs()
                : index == 1
                    ? buildSchedule()
                    : buildLocation(),
          ),
        );
      },
    );
  }

  Widget buildAboutUs() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(space12),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.asset(
              banner,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),
          verticalSpacer16,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'About ',
                style: abel700S32.copyWith(
                  fontSize: 45,
                  color: blueBackground,
                ),
              ),
              Text(
                'Flutterbyte',
                style: abel700S32.copyWith(
                  fontSize: 45,
                  color: blackColor,
                  height: 1,
                ),
              ),
            ],
          ),
          verticalSpacer16,
          Text(
            '''At FlutterBytes Conference, we’re dedicated to creating a premier event experience that connects professionals, thought leaders, and innovators from diverse backgrounds and industries. Our mission is to provide a platform for knowledge sharing, collaboration, and growth, fostering a community that drives progress and innovation.
      
 With a commitment to excellence and a passion for making a meaningful impact, our team works tirelessly to curate a comprehensive program, secure esteemed Speakers, and create a conducive environment for meaningful connections and learning.
      
Flutterbyte values are:
- Connection: We believe in the power of people coming together to achieve great things.
- Innovation: We embrace fresh ideas and perspectives that shape the future.
- Growth: We strive to create opportunities for personal and professional development.
- Community: We’re dedicated to building a supportive and inclusive network''',
            style: abel600S20,
          ),
        ],
      ),
    );
  }

  Widget buildSchedule() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(space12),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.asset(
              banner,
              width: double.infinity,
              fit: BoxFit.cover,
              height: 200,
              alignment: Alignment.topCenter,
            ),
          ),
          verticalSpacer16,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Event ',
                style: abel700S32.copyWith(
                  fontSize: 45,
                  color: blueBackground,
                ),
              ),
              Text(
                'Schedule',
                style: abel700S32.copyWith(
                  fontSize: 45,
                  color: blackColor,
                  height: 1,
                ),
              ),
            ],
          ),
          verticalSpacer8,
          Center(
            child: Container(
              padding: const EdgeInsets.all(space8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(space12),
                border: Border.all(color: blue1, width: 2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Ladies Event [Friday]',
                    style: abel700S16.copyWith(color: blue1),
                  ),
                  horizontalSpacer16,
                  Container(
                    width: 1,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(space12),
                      color: blackColor,
                    ),
                  ),
                  horizontalSpacer16,
                  Text('Saturday Agenda', style: abel700S16),
                ],
              ),
            ),
          ),
          verticalSpacer16,
          Container(
            padding: const EdgeInsets.all(space12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(space12),
              border: Border.all(color: blue1, width: 2),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(space6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(space12),
                    color: blue1,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text('Timeline',
                              style: abel700S16.copyWith(color: whiteColor)),
                        ),
                      ),
                      Expanded(
                          child: Center(
                              child: Text('Session Title',
                                  style:
                                      abel700S16.copyWith(color: whiteColor)))),
                      Expanded(
                          child: Center(
                              child: Text('Anchor (s)',
                                  style:
                                      abel700S16.copyWith(color: whiteColor)))),
                      Expanded(
                          child: Center(
                              child: Text('Hall',
                                  style:
                                      abel700S16.copyWith(color: whiteColor)))),
                    ],
                  ),
                ),
                verticalSpacer16,
                Row(
                  children: [
                    Expanded(
                        child: Center(
                            child:
                                Text('2:30 PM - 3:00 PM', style: abel500S16))),
                    Expanded(
                        child:
                            Center(child: Text('Arrivals', style: abel500S16))),
                    Expanded(
                        child: Center(
                            child: Text('Anuoluwapo Famakinwa & Moyin',
                                style: abel500S16))),
                    Expanded(
                        child: Center(
                            child: Text('Hall Eko Arena', style: abel500S16))),
                  ],
                ),
                verticalSpacer16,
                Row(
                  children: [
                    Expanded(
                        child: Center(
                            child:
                                Text('3:00 PM - 3:10 PM', style: abel500S16))),
                    Expanded(
                        child: Center(child: Text('Games', style: abel500S16))),
                    Expanded(
                        child: Center(
                            child: Text('Ogbonna Emmanuella Ijeoma',
                                style: abel500S16))),
                    Expanded(
                        child: Center(
                            child: Text('Hall Eko Arena', style: abel500S16))),
                  ],
                ),
                verticalSpacer16,
                Row(
                  children: [
                    Expanded(
                        child: Center(
                            child:
                                Text('3:15 PM - 3:35 PM', style: abel500S16))),
                    Expanded(
                        child: Center(
                            child:
                                Text('Technical Session', style: abel500S16))),
                    Expanded(
                        child: Center(
                            child: Text('Mariam Hamzat', style: abel500S16))),
                    Expanded(
                        child: Center(
                            child: Text('Hall Eko Arena', style: abel500S16))),
                  ],
                ),
                verticalSpacer16,
                Row(
                  children: [
                    Expanded(
                        child: Center(
                            child:
                                Text('3:40 PM - 3:50 PM', style: abel500S16))),
                    Expanded(
                        child: Center(
                            child: Text('Slido Games', style: abel500S16))),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Nikki Eke & Ogbonna Emmanuella',
                          style: abel500S16,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Center(
                            child: Text('Hall Eko Arena', style: abel500S16))),
                  ],
                ),
              ],
            ),
          ),
          verticalSpacer16,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('20+ more sessions', style: abel700S16),
              horizontalSpacer16,
              Container(
                padding: const EdgeInsets.all(space8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(space12),
                  border: Border.all(color: blue1, width: 2),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Full agenda of the program',
                      style: abel700S16.copyWith(color: blue1),
                    ),
                    horizontalSpacer8,
                    Icon(Icons.arrow_right_alt_rounded, color: blue1),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildLocation() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Event ',
                style: abel700S32.copyWith(
                  fontSize: 45,
                  color: blueBackground,
                ),
              ),
              Text(
                'Location',
                style: abel700S32.copyWith(
                  fontSize: 45,
                  color: blackColor,
                  height: 1,
                ),
              ),
            ],
          ),
          Text(
            'The Zone, Plot 9 Gbagada Industrial Scheme, Beside UPS, Gbagada Expressway',
            style: abel700S16,
          ),
          verticalSpacer12,
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(space12),
              border: Border.all(
                color: blackColor,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.asset(
              location,
              width: double.infinity,
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
        ],
      ),
    );
  }
}

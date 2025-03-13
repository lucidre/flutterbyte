// ignore_for_file: use_build_context_synchronously

import 'package:flutterbyte/common_libs.dart';
import 'package:flutterbyte/features/home/data/model/committee/committee.dart';
import 'package:flutterbyte/features/home/presentation/pages/organizing_comittee_item.dart';
import 'package:flutterbyte/shared/widgets/page_indicator.dart';

class OrganizingCommitee extends StatefulWidget {
  const OrganizingCommitee({super.key});

  @override
  State<OrganizingCommitee> createState() => _OrganizingCommiteeState();
}

class _OrganizingCommiteeState extends State<OrganizingCommitee> {
  int get numOfItems => committees.length;
  int get initItem => numOfItems * 100;

  late final pageController = PageController(
    viewportFraction: .3,
    initialPage: initItem,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildOrganizingCommittee().fadeInAndMoveFromBottom(),
        verticalSpacer12,
        buildDescription().fadeInAndMoveFromBottom(),
        verticalSpacer24,
        buildPageView(),
        verticalSpacer24,
        buildPageDescription()
      ],
    );
  }

  AppPageIndicator buildPageDescription() {
    return AppPageIndicator(
      count: numOfItems,
      useRemainderFactor: true,
      controller: pageController,
    );
  }

  SizedBox buildDescription() {
    return SizedBox(
      width: 1300,
      child: Text(
        organizingCommitteeDescription,
        style: abel500S16.copyWith(color: whiteColor),
        textAlign: TextAlign.center,
      ),
    );
  }

  SizedBox buildPageView() {
    return SizedBox(
      width: double.infinity,
      height: 550,
      child: PageView.builder(
        controller: pageController,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) {
          return AnimatedBuilder(
            animation: pageController,
            builder: (context, child) {
              double value = 1.0;
              value = (pageController.position.haveDimensions
                      ? pageController.page!
                      : initItem.toDouble()) -
                  index;
              value = (1 - (value.abs() * 0.4)).clamp(0.0, 1.0);
              final size = Curves.easeOut.transform(value) * 500;
              return Center(
                child: Opacity(
                  opacity: value,
                  child: SizedBox(
                    height: size,
                    width: size,
                    child: child,
                  ),
                ),
              );
            },
            child:
                OrganizingCommitteeItem(committees[index % committees.length]),
          );
        },
      ),
    );
  }

  Row buildOrganizingCommittee() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Organizing ',
          style: abel700S32.copyWith(
            fontSize: 45,
            color: blueBackground,
          ),
        ),
        Text(
          'Committee',
          style: abel700S32.copyWith(
            fontSize: 45,
            color: whiteColor,
            height: 1,
          ),
        ),
      ],
    );
  }
}

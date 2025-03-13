import 'package:flutterbyte/common_libs.dart';
import 'package:flutterbyte/features/home/presentation/controller/home_controller.dart';

final _items = [
  'Apply to volunteer',
  'Apply to speak',
  'Be a sponsor',
  'Hackathon',
  'Hackathon Submission',
  'About Us',
];

class AppAppBar extends StatelessWidget {
  const AppAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 1,
      backgroundColor: Colors.transparent,
      pinned: true,
      flexibleSpace: buildBody(),
      toolbarHeight: kToolbarHeight + space32,
    );
  }

  buildBody() {
    return Obx(() {
      final controller = Get.find<HomeController>();
      final isExpanded = controller.isAppBarExpanded;
      return Container(
        child: buildItem1(),
        decoration: BoxDecoration(
          color: isExpanded ? backgroundColor : transparentColor,
          border: Border(
            bottom: BorderSide(
              color: isExpanded ? whiteColor : transparentColor,
              width: 1,
            ),
          ),
        ),
      );
    });
  }

  List<Widget> buildTextItem(int index) {
    bool isLast = _items.length - 1 == index;
    return [
      Text(
        _items[index],
        style: abel700S16.copyWith(color: whiteColor),
      ),
      if (!isLast) ...[
        horizontalSpacer12 * 2,
        Container(
          width: 5,
          height: 5,
          decoration: const BoxDecoration(
            color: whiteColor,
            shape: BoxShape.circle,
          ),
        ),
        horizontalSpacer12 * 2,
      ],
    ];
  }

  buildItem1() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: space32, right: space32),
      child: Row(
        children: [
          buildName().fadeInAndMoveFromBottom(),
          const Spacer(),
          buildAppBarItems().fadeInAndMoveFromBottom(),
          const Spacer(),
          buildGetTickets().fadeInAndMoveFromBottom(),
          horizontalSpacer12,
          buildThemeButton().fadeInAndMoveFromBottom(),
        ],
      ),
    );
  }

  Widget buildAppBarItems() {
    List<Widget> items = [];
    for (int index = 0; index < items.length; index++) {
      items.addAll(buildTextItem(index));
    }

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
      child: Row(
        children: items,
      ),
    ).hover();
  }

  Widget buildGetTickets() {
    return Container(
      padding: const EdgeInsets.all(space12),
      decoration: BoxDecoration(
        color: blueBackground,
        border: Border.all(color: whiteColor),
        borderRadius: BorderRadius.circular(space12),
      ),
      child: Row(
        children: [
          Text(
            'Get Tickets',
            style: abel700S16.copyWith(
              color: whiteColor,
            ),
          ),
          horizontalSpacer8,
          const Icon(
            Icons.arrow_right_alt_rounded,
            color: whiteColor,
            size: 20,
          ),
        ],
      ),
    ).hover();
  }

  Widget buildThemeButton() {
    return Container(
      padding: const EdgeInsets.all(space12),
      constraints: const BoxConstraints(minHeight: 48),
      decoration: BoxDecoration(
        color: blueBackground,
        border: Border.all(color: whiteColor),
        borderRadius: BorderRadius.circular(space12),
      ),
      child: const Icon(
        Icons.nights_stay,
        color: whiteColor,
        size: 20,
      ),
    ).hover();
  }

  Widget buildName() {
    return Row(
      children: [
        Image.asset(
          logoW,
          width: 50,
          height: 50,
        ),
        horizontalSpacer8,
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'FlutterBytes',
              style: abel700S24.copyWith(
                color: whiteColor,
                fontSize: 30,
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
        ),
      ],
    ).hover();
  }
}

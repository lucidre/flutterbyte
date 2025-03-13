// ignore_for_file: use_build_context_synchronously
import 'package:flutterbyte/common_libs.dart';
import 'package:flutterbyte/features/home/domain/usecases/home_service.dart';
import 'package:flutterbyte/features/home/data/data_sources/home_data_source.dart';
import 'package:flutterbyte/features/home/presentation/controller/home_controller.dart';
import 'package:flutterbyte/features/home/data/repositorites/home_repository_impl.dart';
import 'package:flutterbyte/features/home/presentation/pages/conference_stripe.dart';
import 'package:flutterbyte/features/home/presentation/pages/home_title_widget.dart';
import 'package:flutterbyte/features/home/presentation/pages/footer.dart';
import 'package:flutterbyte/features/home/presentation/pages/organizing_commitee.dart';
import 'package:flutterbyte/features/home/presentation/pages/appbar.dart';
import 'package:flutterbyte/features/home/presentation/pages/speaker_line_up.dart';

//todo count down to it.

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    final controller = Get.put(
      HomeController(
        HomeService(
          HomeRepositoryImpl(
            HomeDataSource(),
          ),
        ),
      ),
    );
    controller.getHome();
    controller.addAppBarListener();
    controller.startHomeButton1Timer();
  }

  buildHoverFollower() {
    final width = context.screenWidth / 3;
    return GetX<HomeController>(
      builder: (controller) {
        final position = controller.mouseRegion;
        return AnimatedPositioned(
          duration: fastDuration,
          left: position.dx - width / 2,
          top: position.dy - width / 2,
          child: Opacity(
            opacity: 0.3,
            child: Container(
              width: width,
              height: width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: hoverGradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(colors: backgroundGradient),
        ),
        child: MouseRegion(
          onHover: (details) =>
              Get.find<HomeController>().mouseRegion = details.position,
          child: Stack(
            children: [
              buildHoverFollower(),
              buildBody(),
            ],
          ),
        ),
      ),
    );
  }

  bool onScrollNotification(notification) {
    if (notification is ScrollUpdateNotification) {
      final controller = Get.find<HomeController>();
      final isScrollingUp = controller.isScrollingUp;
      if (notification.scrollDelta != null &&
          notification.scrollDelta! > 1 &&
          !isScrollingUp) {
        controller.isScrollingUp = true;
      } else if (notification.scrollDelta != null &&
          notification.scrollDelta! < -1 &&
          isScrollingUp) {
        controller.isScrollingUp = false;
      }
    }
    return true;
  }

  Widget buildBody() {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) => onScrollNotification(notification),
      child: CustomScrollView(
        controller: Get.find<HomeController>().scrollController,
        slivers: [
          SliverToBoxAdapter(child: verticalSpacer32),
          const AppAppBar(),
          const SliverToBoxAdapter(child: Title()),
          SliverToBoxAdapter(child: verticalSpacer32 * 2),
          SliverToBoxAdapter(child: buildBodyItem2()),
          SliverToBoxAdapter(child: verticalSpacer32 * 2),
          const SliverToBoxAdapter(child: OrganizingCommitee()),
          SliverToBoxAdapter(child: verticalSpacer32 * 2),
          const SliverToBoxAdapter(
            child: Center(
              child: SizedBox(
                width: 1500,
                child: SpeakerLineUp(),
              ),
            ),
          ),
          SliverToBoxAdapter(child: verticalSpacer32 * 2),
          SliverToBoxAdapter(
            child: Center(
              child: SizedBox(
                width: context.screenWidth * .95,
                child: const Footer().hover(1.02),
              ),
            ),
          ),
          SliverToBoxAdapter(child: verticalSpacer32),
        ],
      ),
    );
  }

  buildBodyItem2() {
    return Transform.scale(
      scale: 1.1,
      child: const Stack(
        children: [
          ConferenceStripe(isFlipped: false),
          ConferenceStripe(isFlipped: true),
        ],
      ),
    );
  }
}

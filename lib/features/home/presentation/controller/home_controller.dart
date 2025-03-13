import 'package:flutterbyte/common_libs.dart';
import 'package:flutterbyte/features/home/data/model/home_button/home_button.dart';
import 'package:flutterbyte/features/home/domain/usecases/home_service.dart';

class HomeController extends GetxController {
  Timer? timer;
  final _timerDuration = const Duration(seconds: 6);
  final HomeService homeService;

  HomeController(this.homeService);

  final Rx<Offset> _mouseRegion = const Offset(0, 0).obs;
  Offset get mouseRegion => _mouseRegion.value;
  set mouseRegion(Offset region) => _mouseRegion(region);

  final Rx<ScrollController> _scrollController = ScrollController().obs;
  ScrollController get scrollController => _scrollController.value;

  final RxBool _isAppBarExpanded = false.obs;
  bool get isAppBarExpanded => _isAppBarExpanded.value;
  set isAppBarExpanded(bool value) => _isAppBarExpanded.value = value;

  final RxBool _isScrollingUp = false.obs;
  bool get isScrollingUp => _isScrollingUp.value;
  set isScrollingUp(bool value) => _isScrollingUp.value = value;

  final Rx<HomeButtonModel> _homeButton = buttonModels.first.obs;
  HomeButtonModel get homeButton => _homeButton.value;
  Rx<HomeButtonModel> get homeButtonRx => _homeButton;
  set homeButton(HomeButtonModel model) {
    _homeButton(model);
    startHomeButton1Timer();
  }

  getHome() async {
    try {
      final data = await homeService.getHome();
      return data;
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  addAppBarListener() {
    scrollController.addListener(() {
      if (scrollController.offset > 100 && !isAppBarExpanded) {
        isAppBarExpanded = true;
      } else if (scrollController.offset <= 100 && isAppBarExpanded) {
        isAppBarExpanded = false;
      }
    });
  }

  startHomeButton1Timer() {
    timer?.cancel();

    timer = Timer.periodic(_timerDuration, (timer) {
      final index = buttonModels.indexOf(homeButton);
      if (index != -1) {
        if (index == buttonModels.length - 1) {
          homeButton = buttonModels.first;
        } else {
          homeButton = buttonModels[index + 1];
        }
      }
    });
  }
}

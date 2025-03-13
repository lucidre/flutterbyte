import 'package:flutterbyte/common_libs.dart';

///App Scaaffold
class AppScaffold extends StatelessWidget {
  final Widget body;
  final bool enableInternetCheck;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final Color? backgroundColor;
  final List<Widget> bannerActions;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const AppScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.floatingActionButtonLocation,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.backgroundColor,
    this.bannerActions = const [],
    this.enableInternetCheck = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: backgroundColor ?? context.backgroundColor,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );
  }
}

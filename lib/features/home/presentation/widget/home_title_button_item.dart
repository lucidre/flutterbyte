import 'package:flutterbyte/common_libs.dart';
import 'package:flutterbyte/features/home/data/model/home_button/home_button.dart';
import 'package:flutterbyte/features/home/presentation/controller/home_controller.dart';

class HomeTitleButtonItem extends StatelessWidget {
  final HomeButtonModel model;
  const HomeTitleButtonItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    const easeIn = Curves.easeIn;
    final colorWithOpacity = model.color.withOpacity(0.3);
    final roundedRectangleBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(space32),
    );

    return GetX<HomeController>(builder: (controller) {
      final selected = model == controller.homeButton;
      final tween = Tween(end: selected ? 1.0 : 0.0);

      return TweenAnimationBuilder<double>(
        tween: tween,
        curve: easeIn,
        duration: fastDuration,
        builder: (_, value, __) {
          return InkWell(
            onTap: () => controller.homeButton = model,
            customBorder: roundedRectangleBorder,
            focusColor: colorWithOpacity,
            highlightColor: colorWithOpacity,
            splashColor: colorWithOpacity,
            hoverColor: colorWithOpacity,
            child: buildBody(value, selected),
          );
        },
      );
    });
  }

  Container buildBody(double value, bool selected) {
    const margin = EdgeInsets.only(left: space12, right: space12);
    const paddding = EdgeInsets.all(space6);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.lerp(whiteColor, model.color, value) ?? whiteColor,
          width: selected ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(space12),
      ),
      margin: margin,
      padding: paddding,
      child: Row(
        children: [
          buildIcon(value),
          horizontalSpacer12,
          buildText(value),
          horizontalSpacer12,
        ],
      ),
    );
  }

  Text buildText(double value) {
    return Text(
      model.text,
      style: abel700S24.copyWith(
        color: Color.lerp(whiteColor, model.color, value),
      ),
    );
  }

  ClipRect buildIcon(double value) {
    const alignment = Alignment(-0.2, 0.0);
    return ClipRect(
      clipBehavior: Clip.antiAlias,
      child: Align(
        alignment: alignment,
        widthFactor: value,
        child: Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(space12 - space6),
            color: Color.lerp(Colors.transparent, model.color, value),
          ),
          child: Icon(model.icon, color: whiteColor, size: 20),
        ),
      ),
    );
  }
}

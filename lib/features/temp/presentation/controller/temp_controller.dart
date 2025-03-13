import 'package:flutterbyte/features/temp/domain/usecases/temp_service.dart';
import 'package:get/get.dart';

class TempController extends GetxController {
  final TempService tempService;
  TempController(this.tempService);

  getTemp() async {
    try {
      final data = await tempService.getTemp();
      return data;
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }
}

// ignore_for_file: use_build_context_synchronously
import 'package:flutterbyte/common_libs.dart';
import 'package:flutterbyte/features/temp/data/data_sources/temp_data_source.dart';
import 'package:flutterbyte/features/temp/data/repositorites/temp_repository_impl.dart';
import 'package:flutterbyte/features/temp/domain/usecases/temp_service.dart';
import 'package:flutterbyte/features/temp/presentation/controller/temp_controller.dart';

class CreateTempScreen extends StatefulWidget {
  const CreateTempScreen({super.key});

  @override
  State<CreateTempScreen> createState() => _CreateTempScreenState();
}

class _CreateTempScreenState extends State<CreateTempScreen> {
  @override
  void initState() {
    super.initState();

    final controller = Get.put(
      TempController(
        TempService(
          TempRepositoryImpl(
            TempDataSource(),
          ),
        ),
      ),
    );
    controller.getTemp();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Container(),
    );
  }
}

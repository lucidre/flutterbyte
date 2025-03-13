import 'package:flutterbyte/features/temp/domain/repositories/temp_repository.dart';

class TempService {
  final TempRepository repository;

  TempService(this.repository);

  Future<void> getTemp() => repository.getTemp();
}

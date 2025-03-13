import 'package:flutterbyte/features/temp/data/data_sources/temp_data_source.dart';
import 'package:flutterbyte/features/temp/domain/repositories/temp_repository.dart';

class TempRepositoryImpl implements TempRepository {
  final TempDataSource remoteDataSource;

  TempRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> getTemp() async {
    try {
      final response = await remoteDataSource.getTemp();
      return response;
    } catch (exception) {
      return Future.error(exception);
    }
  }
}

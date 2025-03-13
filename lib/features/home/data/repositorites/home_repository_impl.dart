import 'package:flutterbyte/features/home/data/data_sources/home_data_source.dart';
import 'package:flutterbyte/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource remoteDataSource;

  HomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> getHome() async {
    try {
      final response = await remoteDataSource.getHome();
      return response;
    } catch (exception) {
      return Future.error(exception);
    }
  }
}

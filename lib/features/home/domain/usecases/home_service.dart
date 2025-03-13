import 'package:flutterbyte/features/home/domain/repositories/home_repository.dart';

class HomeService {
  final HomeRepository repository;

  HomeService(this.repository);

  Future<void> getHome() => repository.getHome();
}

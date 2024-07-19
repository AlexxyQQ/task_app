import 'package:task_app/core/common/exports.dart';

class UserDI {
  void register() {
    // Data sources
    locator.registerFactory(
      () => UserRemoteDataSource(
        api: locator(),
      ),
    );
    // Repositories
    locator.registerFactory<IUserRepository>(
      () => UserRepositoryImpl(
        remoteDataSource: locator(),
      ),
    );
    // Usecases
    locator.registerFactory(
      () => GetAllUsersUsecase(
        repository: locator(),
      ),
    );
    locator.registerFactory(
      () => GetSingleUserUsecase(
        repository: locator(),
      ),
    );
    // Cubit
    locator.registerLazySingleton(
      () => UserCubit(
        getAllUsersUsecase: locator(),
        getSingleUserUsecase: locator(),
      ),
    );
  }
}

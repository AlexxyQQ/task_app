import 'package:task_app/core/common/exports.dart';

class PhotoDI {
  void register() {
    // Data sources
    locator.registerFactory(
      () => PhotoRemoteDataSource(
        api: locator(),
      ),
    );
    // Repositories
    locator.registerFactory<IPhotoRepository>(
      () => PhotoRepositoryImpl(
        remoteDataSource: locator(),
      ),
    );
    // Usecases

    locator.registerFactory(
      () => GetAllPhotosOfUserUsecase(
        repository: locator(),
      ),
    );
    // Cubit
    locator.registerLazySingleton(
      () => PhotoCubit(
        getAllPhotosOfUserUsecase: locator(),
      ),
    );
  }
}

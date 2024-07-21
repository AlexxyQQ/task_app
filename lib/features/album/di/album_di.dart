import 'package:task_app/core/common/exports.dart';

class AlbumDI {
  void register() {
    // Data sources
    locator.registerFactory(
      () => AlbumRemoteDataSource(
        api: locator(),
      ),
    );
    // Repositories
    locator.registerFactory<IAlbumRepository>(
      () => AlbumRepositoryImpl(
        remoteDataSource: locator(),
      ),
    );
    // Usecases

    locator.registerFactory(
      () => GetAllAlbumsOfUserUsecase(
        repository: locator(),
      ),
    );
    // Cubit
    locator.registerLazySingleton(
      () => AlbumCubit(
        getAllAlbumsOfUserUsecase: locator(),
      ),
    );
  }
}

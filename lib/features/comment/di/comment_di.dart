import 'package:task_app/core/common/exports.dart';

class CommentDI {
  void register() {
    // Data sources
    locator.registerFactory(
      () => CommentRemoteDataSource(
        api: locator(),
      ),
    );
    // Repositories
    locator.registerFactory<ICommentRepository>(
      () => CommentRepositoryImpl(
        remoteDataSource: locator(),
      ),
    );
    // Usecases

    locator.registerFactory(
      () => GetAllCommentsUsecase(
        repository: locator(),
      ),
    );
    // Cubit
    locator.registerLazySingleton(
      () => CommentCubit(
        getAllCommentsUsecase: locator(),
      ),
    );
  }
}

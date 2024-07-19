import 'package:task_app/core/common/exports.dart';
import 'package:task_app/features/posts/domain/usecase/get_single_posts_usecase.dart';

class PostsDI {
  void register() {
    // Data sources
    locator.registerFactory(
      () => PostsRemoteDataSource(
        api: locator(),
      ),
    );
    // Repositories
    locator.registerFactory<IPostsRepository>(
      () => PostsRepositoryImpl(
        remoteDataSource: locator(),
      ),
    );
    // Usecases
    locator.registerFactory(
      () => GetAllPostUsecase(
        repository: locator(),
      ),
    );
    locator.registerFactory(
      () => GetSinglePostUsecase(
        repository: locator(),
      ),
    );
    // Cubit
    locator.registerLazySingleton(
      () => PostsCubit(
        getAllPostUsecase: locator(),
        getSinglePostUsecase: locator(),
      ),
    );
  }
}

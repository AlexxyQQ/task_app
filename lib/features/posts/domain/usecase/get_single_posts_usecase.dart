import 'package:task_app/core/common/exports.dart';
import 'package:dartz/dartz.dart';

class GetSinglePostUsecase extends Usecase<PostsEntity, int> {
  final IPostsRepository repository;

  GetSinglePostUsecase({required this.repository});

  @override
  Future<Either<AppErrorHandler, PostsEntity>> call(int params) async {
    return await repository.getSinglePosts(
      id: params,
    );
  }
}

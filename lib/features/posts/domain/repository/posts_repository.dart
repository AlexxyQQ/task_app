import 'package:task_app/core/common/exports.dart';
import 'package:dartz/dartz.dart';

abstract class IPostsRepository {
  Future<Either<AppErrorHandler, List<PostsEntity>>> getAllPosts();
  Future<Either<AppErrorHandler, PostsEntity>> getSinglePosts({
    required int id,
  });
}

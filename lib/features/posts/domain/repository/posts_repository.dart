import 'package:task_app/core/common/exports.dart';
import 'package:dartz/dartz.dart';

abstract class IPostsRepository {
  Future<Either<AppErrorHandler, List<PostEntity>>> getAllPosts();
  Future<Either<AppErrorHandler, PostEntity>> getSinglePosts({
    required int id,
  });
}

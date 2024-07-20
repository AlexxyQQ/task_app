import 'package:task_app/core/common/exports.dart';
import 'package:dartz/dartz.dart';

abstract class ICommentRepository {
  Future<Either<AppErrorHandler, List<CommentEntity>>> getAllComments({
    required int postId,
  });
  Future<Either<AppErrorHandler, CommentEntity>> addComment({
    required int postId,
    required String name,
    required String email,
    required String body,
  });
}

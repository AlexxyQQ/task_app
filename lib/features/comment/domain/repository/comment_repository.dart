import 'package:dartz/dartz.dart';
import 'package:task_app/core/common/exports.dart';

abstract class ICommentRepository {
  Future<Either<AppErrorHandler, List<CommentEntity>>> getAllComments({
    required int postId,
  });
}

import 'package:task_app/core/common/exports.dart';
import 'package:dartz/dartz.dart';

class GetAllCommentsUsecase extends Usecase<List<CommentEntity>, int> {
  final ICommentRepository repository;

  GetAllCommentsUsecase({required this.repository});

  @override
  Future<Either<AppErrorHandler, List<CommentEntity>>> call(int params) async {
    return await repository.getAllComments(
      postId: params,
    );
  }
}

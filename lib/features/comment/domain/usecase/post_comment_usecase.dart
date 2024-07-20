import 'package:task_app/core/common/exports.dart';
import 'package:dartz/dartz.dart';

class PostCommentUsecase extends Usecase<CommentEntity, PostCommentParams> {
  final ICommentRepository repository;

  PostCommentUsecase({required this.repository});

  @override
  Future<Either<AppErrorHandler, CommentEntity>> call(
      PostCommentParams params) async {
    return await repository.addComment(
      postId: params.postId,
      name: params.name,
      email: params.email,
      body: params.body,
    );
  }
}

class PostCommentParams {
  final int postId;
  final String name;
  final String email;
  final String body;

  PostCommentParams({
    required this.postId,
    required this.name,
    required this.email,
    required this.body,
  });
}

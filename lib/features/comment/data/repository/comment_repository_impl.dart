import 'package:task_app/core/common/exports.dart';
import 'package:dartz/dartz.dart';

class CommentRepositoryImpl implements ICommentRepository {
  final CommentRemoteDataSource remoteDataSource;

  CommentRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<AppErrorHandler, List<CommentModel>>> getAllComments(
      {required int postId}) async {
    return await remoteDataSource.getAllComments(postId: postId);
  }

  @override
  Future<Either<AppErrorHandler, CommentModel>> addComment(
      {required int postId,
      required String name,
      required String email,
      required String body}) async {
    return await remoteDataSource.addComment(
      postId: postId,
      name: name,
      email: email,
      body: body,
    );
  }
}

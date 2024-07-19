import 'package:dartz/dartz.dart';
import 'package:task_app/core/common/exports.dart';

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
}

import 'package:dartz/dartz.dart';
import 'package:task_app/core/common/exports.dart';

class CommentRemoteDataSource {
  final Api api;

  CommentRemoteDataSource({
    required this.api,
  });

  Future<Either<AppErrorHandler, List<CommentModel>>> getAllComments({
    required int postId,
  }) async {
    try {
      final response = await api.sendRequest.get(
        "${ApiEndpoints.postURL}/$postId/comments",
      );

      if (response.statusCode == 200) {
        return Right(
          (response.data as List)
              .map(
                (e) => CommentModel.fromMap(e),
              )
              .toList(),
        );
      } else {
        return Left(
          AppErrorHandler(
            message: response.statusMessage ?? 'Something went wrong',
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        AppErrorHandler.fromDioException(e),
      );
    } catch (e) {
      return Left(
        AppErrorHandler(
          message: 'Something went wrong',
        ),
      );
    }
  }
}

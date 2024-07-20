import 'package:task_app/core/common/exports.dart';
import 'package:dartz/dartz.dart';

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

  Future<Either<AppErrorHandler, CommentModel>> addComment({
    required int postId,
    required String name,
    required String email,
    required String body,
  }) async {
    try {
      final response = await api.sendRequest.post(
        "${ApiEndpoints.postURL}/$postId/comments",
        data: {
          'name': name,
          'email': email,
          'body': body,
        },
      );

      if (response.statusCode == 201) {
        return Right(
          CommentModel.fromMap(response.data),
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

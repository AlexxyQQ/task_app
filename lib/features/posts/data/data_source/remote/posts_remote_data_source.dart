import 'package:task_app/core/common/exports.dart';
import 'package:dartz/dartz.dart';

class PostsRemoteDataSource {
  final Api api;

  PostsRemoteDataSource({required this.api});

  Future<Either<AppErrorHandler, List<PostModel>>> getAllPosts() async {
    try {
      final response = await api.sendRequest.get(ApiEndpoints.postURL);

      if (response.statusCode == 200) {
        return Right(
          (response.data as List)
              .map(
                (e) => PostModel.fromMap(e),
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

  Future<Either<AppErrorHandler, PostModel>> getSinglePosts({
    required int id,
  }) async {
    try {
      final response = await api.sendRequest.get("${ApiEndpoints.postURL}/$id");

      if (response.statusCode == 200) {
        return Right(
          PostModel.fromMap(response.data),
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

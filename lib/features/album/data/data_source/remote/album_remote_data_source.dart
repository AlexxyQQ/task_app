import 'package:task_app/core/common/exports.dart';
import 'package:dartz/dartz.dart';

class AlbumRemoteDataSource {
  final Api api;

  AlbumRemoteDataSource({required this.api});

  Future<Either<AppErrorHandler, List<AlbumModel>>> getAllAlbumsOfUser({
    required int userId,
  }) async {
    try {
      final response =
          await api.sendRequest.get("${ApiEndpoints.userURL}/$userId/albums");

      if (response.statusCode == 200) {
        return Right(
          (response.data as List)
              .map(
                (e) => AlbumModel.fromMap(e),
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

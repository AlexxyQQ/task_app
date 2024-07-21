import 'package:dartz/dartz.dart';
import 'package:task_app/core/common/exports.dart';

class PhotoRemoteDataSource {
  final Api api;

  PhotoRemoteDataSource({required this.api});

  Future<Either<AppErrorHandler, List<PhotoModel>>> getAllPhotosOfUser({
    required int userId,
  }) async {
    try {
      final response =
          await api.sendRequest.get("${ApiEndpoints.userURL}/$userId/photos");

      if (response.statusCode == 200) {
        return Right(
          (response.data as List)
              .map(
                (e) => PhotoModel.fromMap(e),
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

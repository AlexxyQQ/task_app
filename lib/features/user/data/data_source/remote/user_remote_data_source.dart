import 'package:task_app/core/common/exports.dart';
import 'package:dartz/dartz.dart';

class UserRemoteDataSource {
  final Api api;

  UserRemoteDataSource({required this.api});

  Future<Either<AppErrorHandler, List<UserModel>>> getAllUsers() async {
    try {
      final response = await api.sendRequest.get(
        ApiEndpoints.userURL,
      );

      if (response.statusCode == 200) {
        return Right(
          (response.data as List)
              .map(
                (e) => UserModel.fromMap(e),
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

  Future<Either<AppErrorHandler, UserModel>> getSingleUser({
    required int id,
  }) async {
    try {
      final response = await api.sendRequest.get(
        "${ApiEndpoints.userURL}/$id",
      );

      if (response.statusCode == 200) {
        return Right(
          UserModel.fromMap(response.data),
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

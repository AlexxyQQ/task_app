import 'package:task_app/core/common/exports.dart';
import 'package:dartz/dartz.dart';

abstract class IUserRepository {
  Future<Either<AppErrorHandler, List<UserEntity>>> getAllUsers();
  Future<Either<AppErrorHandler, UserEntity>> getSingleUser({
    required int id,
  });
}

import 'package:task_app/core/common/exports.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl implements IUserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<AppErrorHandler, List<UserModel>>> getAllUsers() async {
    return await remoteDataSource.getAllUsers();
  }

  @override
  Future<Either<AppErrorHandler, UserModel>> getSingleUser(
      {required int id}) async {
    return await remoteDataSource.getSingleUser(id: id);
  }
}

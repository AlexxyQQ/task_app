import 'package:task_app/core/common/exports.dart';
import 'package:dartz/dartz.dart';

class GetAllUsersUsecase extends Usecase<List<UserEntity>, void> {
  final IUserRepository repository;

  GetAllUsersUsecase({required this.repository});

  @override
  Future<Either<AppErrorHandler, List<UserEntity>>> call(void params) async {
    return await repository.getAllUsers();
  }
}

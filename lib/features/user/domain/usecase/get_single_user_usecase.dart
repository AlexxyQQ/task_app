import 'package:task_app/core/common/exports.dart';
import 'package:dartz/dartz.dart';

class GetSingleUserUsecase extends Usecase<UserEntity, int> {
  final IUserRepository repository;

  GetSingleUserUsecase({required this.repository});

  @override
  Future<Either<AppErrorHandler, UserEntity>> call(int params) async {
    return await repository.getSingleUser(
      id: params,
    );
  }
}

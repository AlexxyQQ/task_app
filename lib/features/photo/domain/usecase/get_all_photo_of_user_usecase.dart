import 'package:task_app/core/common/exports.dart';
import 'package:dartz/dartz.dart';

class GetAllPhotosOfUserUsecase extends Usecase<List<PhotoEntity>, int> {
  final IPhotoRepository repository;

  GetAllPhotosOfUserUsecase({required this.repository});

  @override
  Future<Either<AppErrorHandler, List<PhotoEntity>>> call(int params) async {
    return await repository.getAllPhotosOfUser(
      userId: params,
    );
  }
}

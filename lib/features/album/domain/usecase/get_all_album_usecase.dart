import 'package:dartz/dartz.dart';
import 'package:task_app/core/common/exports.dart';

class GetAllAlbumsOfUserUsecase extends Usecase<List<AlbumEntity>, int> {
  final IAlbumRepository repository;

  GetAllAlbumsOfUserUsecase({required this.repository});

  @override
  Future<Either<AppErrorHandler, List<AlbumEntity>>> call(int params) async {
    return await repository.getAllAlbumsOfUser(
      userId: params,
    );
  }
}

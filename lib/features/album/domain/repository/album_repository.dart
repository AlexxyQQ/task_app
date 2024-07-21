import 'package:task_app/core/common/exports.dart';
import 'package:dartz/dartz.dart';

abstract class IAlbumRepository {
  Future<Either<AppErrorHandler, List<AlbumEntity>>> getAllAlbumsOfUser({
    required int userId,
  });
}

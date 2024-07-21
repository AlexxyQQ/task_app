import 'package:dartz/dartz.dart';
import 'package:task_app/core/common/exports.dart';

abstract class IAlbumRepository {
  Future<Either<AppErrorHandler, List<AlbumEntity>>> getAllAlbumsOfUser({
    required int userId,
  });
}

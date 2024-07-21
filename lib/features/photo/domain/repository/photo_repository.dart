import 'package:dartz/dartz.dart';
import 'package:task_app/core/common/exports.dart';

abstract class IPhotoRepository {
  Future<Either<AppErrorHandler, List<PhotoEntity>>> getAllPhotosOfUser({
    required int userId,
  });
}

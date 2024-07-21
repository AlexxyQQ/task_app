import 'package:dartz/dartz.dart';
import 'package:task_app/core/common/exports.dart';

class PhotoRepositoryImpl implements IPhotoRepository {
  final PhotoRemoteDataSource remoteDataSource;

  PhotoRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<AppErrorHandler, List<PhotoModel>>> getAllPhotosOfUser(
      {required int userId}) async {
    return await remoteDataSource.getAllPhotosOfUser(userId: userId);
  }
}

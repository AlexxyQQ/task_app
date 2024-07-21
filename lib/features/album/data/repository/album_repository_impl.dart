import 'package:dartz/dartz.dart';
import 'package:task_app/core/common/exports.dart';

class AlbumRepositoryImpl implements IAlbumRepository {
  final AlbumRemoteDataSource remoteDataSource;

  AlbumRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<AppErrorHandler, List<AlbumModel>>> getAllAlbumsOfUser(
      {required int userId}) async {
    return await remoteDataSource.getAllAlbumsOfUser(userId: userId);
  }
}

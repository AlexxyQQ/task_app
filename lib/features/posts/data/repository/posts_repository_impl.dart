import 'package:task_app/core/common/exports.dart';
import 'package:dartz/dartz.dart';

class PostsRepositoryImpl implements IPostsRepository {
  final PostsRemoteDataSource remoteDataSource;

  PostsRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<AppErrorHandler, List<PostsModel>>> getAllPosts() async {
    return await remoteDataSource.getAllPosts();
  }

  @override
  Future<Either<AppErrorHandler, PostsModel>> getSinglePosts(
      {required int id}) async {
    return await remoteDataSource.getSinglePosts(id: id);
  }
}

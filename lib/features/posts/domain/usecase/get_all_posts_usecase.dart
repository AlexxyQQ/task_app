import 'package:task_app/core/common/exports.dart';
import 'package:dartz/dartz.dart';

class GetAllPostUsecase extends Usecase<List<PostEntity>, void> {
  final IPostsRepository repository;

  GetAllPostUsecase({required this.repository});

  @override
  Future<Either<AppErrorHandler, List<PostEntity>>> call(void params) async {
    return await repository.getAllPosts();
  }
}

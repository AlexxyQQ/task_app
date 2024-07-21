import 'package:task_app/core/common/exports.dart';

class BlocProvidersList {
  static final blocList = [
    BlocProvider<LocaleCubit>(
      create: (context) => locator<LocaleCubit>(),
    ),
    BlocProvider<PostsCubit>(
      create: (context) => locator<PostsCubit>(),
    ),
    BlocProvider<CommentCubit>(
      create: (context) => locator<CommentCubit>(),
    ),
    BlocProvider<UserCubit>(
      create: (context) => locator<UserCubit>(),
    ),
    BlocProvider<AlbumCubit>(
      create: (context) => locator<AlbumCubit>(),
    ),
    BlocProvider<PhotoCubit>(
      create: (context) => locator<PhotoCubit>(),
    ),
  ];
}

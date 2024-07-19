import 'package:task_app/core/common/exports.dart';

class BlocProvidersList {
  static final blocList = [
    BlocProvider<LocaleCubit>(
      create: (context) => locator<LocaleCubit>(),
    ),
    BlocProvider<PostsCubit>(
      create: (context) => locator<PostsCubit>(),
    ),
  ];
}

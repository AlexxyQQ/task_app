import 'package:task_app/core/common/exports.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit({
    required this.getAllCommentsUsecase,
  }) : super(CommentState.initial());

  final GetAllCommentsUsecase getAllCommentsUsecase;

  Future<void> getAllComments({
    void Function(String)? onError,
    void Function()? onSuccess,
    void Function()? navigation,
    required int postId,
  }) async {
    emit(
      state.copyWith(
        isLoading: true,
        isSuccess: false,
        error: () => null,
      ),
    );

    final result = await getAllCommentsUsecase.call(postId);

    result.fold(
      (error) {
        emit(
          state.copyWith(
            isLoading: false,
            isSuccess: false,
            error: () => error,
          ),
        );

        if (onError != null) {
          onError(error.message);
        }
      },
      (data) {
        emit(
          state.copyWith(
            isLoading: false,
            isSuccess: true,
            comments: data,
            error: () => null,
          ),
        );

        if (onSuccess != null) {
          onSuccess();
        }

        if (navigation != null) {
          navigation();
        }
      },
    );
  }
}

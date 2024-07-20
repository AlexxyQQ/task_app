import 'package:task_app/core/common/exports.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit({
    required this.getAllCommentsUsecase,
    required this.postCommentUsecase,
  }) : super(CommentState.initial());

  final GetAllCommentsUsecase getAllCommentsUsecase;
  final PostCommentUsecase postCommentUsecase;

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

  Future<void> postComment({
    void Function(String)? onError,
    void Function()? onSuccess,
    void Function()? navigation,
    required int postId,
    required String name,
    required String email,
    required String body,
  }) async {
    emit(
      state.copyWith(
        isLoading: true,
        isSuccess: false,
        error: () => null,
      ),
    );

    final result = await postCommentUsecase.call(
      PostCommentParams(
        postId: postId,
        name: name,
        email: email,
        body: body,
      ),
    );

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
            error: () => null,
          ),
        );
        // after the comment is posted, we add the comment to the list of comments
        // so that the user can see the comment they posted
        emit(
          state.copyWith(
            comments: [...state.comments, data],
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

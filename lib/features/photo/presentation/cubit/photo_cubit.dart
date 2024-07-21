import 'package:task_app/core/common/exports.dart';

class PhotoCubit extends Cubit<PhotoState> {
  PhotoCubit({
    required this.getAllPhotosOfUserUsecase,
  }) : super(PhotoState.initial());

  final GetAllPhotosOfUserUsecase getAllPhotosOfUserUsecase;

  Future<void> getAllPhotosOfUser({
    void Function(String)? onError,
    void Function()? onSuccess,
    void Function()? navigation,
    required int userId,
  }) async {
    emit(
      state.copyWith(
        isLoading: true,
        isSuccess: false,
        error: () => null,
      ),
    );

    final result = await getAllPhotosOfUserUsecase.call(userId);

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
            userPhotos: data,
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

  void selectPhoto({
    required PhotoEntity photo,
  }) {
    emit(
      state.copyWith(
        selectedPhoto: () => photo,
      ),
    );
  }
}

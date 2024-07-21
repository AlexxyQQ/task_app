import 'package:task_app/core/common/exports.dart';

class AlbumCubit extends Cubit<AlbumState> {
  AlbumCubit({
    required this.getAllAlbumsOfUserUsecase,
  }) : super(AlbumState.initial());

  final GetAllAlbumsOfUserUsecase getAllAlbumsOfUserUsecase;

  Future<void> getAllAlbumOfUser({
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

    final result = await getAllAlbumsOfUserUsecase.call(userId);

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
            userAlbums: data,
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

  void selectAlbum({
    required AlbumEntity album,
  }) {
    emit(
      state.copyWith(
        selectedAlbum: () => album,
      ),
    );
  }
}

import 'package:task_app/core/common/exports.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit({
    required this.getAllPostUsecase,
    required this.getSinglePostUsecase,
  }) : super(PostsState.initial()) {
    getAllPosts();
  }

  final GetAllPostUsecase getAllPostUsecase;
  final GetSinglePostUsecase getSinglePostUsecase;

  Future<void> getAllPosts({
    void Function(String)? onError,
    void Function()? onSuccess,
    void Function()? navigation,
  }) async {
    emit(
      state.copyWith(
        isLoading: true,
        isSuccess: false,
        error: null,
      ),
    );

    final result = await getAllPostUsecase.call(null);

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
            allPosts: data,
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

  Future<void> getSinglePost({
    void Function(String)? onError,
    void Function()? onSuccess,
    void Function()? navigation,
    required int id,
  }) async {
    emit(
      state.copyWith(
        isLoading: true,
        isSuccess: false,
        error: null,
      ),
    );

    final result = await getSinglePostUsecase.call(id);

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
            selectedPost: () => data,
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

  void searchToggle(
    bool isSearching,
  ) {
    emit(
      state.copyWith(
        isSearching: isSearching,
        filteredPosts: state.allPosts,
      ),
    );
  }

  void filterPosts({
    required String query,
  }) {
    final filteredPosts = state.allPosts.where((post) {
      return post.title?.toLowerCase().contains(
                query.toLowerCase(),
              ) ==
          true;
    }).toList();
    emit(
      state.copyWith(
        filteredPosts: filteredPosts,
      ),
    );
  }

  void clearSearch() {
    emit(
      state.copyWith(
        filteredPosts: const [],
        isSearching: false,
        searchController: TextEditingController(),
      ),
    );
  }
}

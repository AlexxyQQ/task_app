import 'package:task_app/core/common/exports.dart';
import 'dart:developer';

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
        error: () => null,
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
        _getAllPostWithUser(posts: data).then((value) {
          emit(
            state.copyWith(
              isLoading: false,
              isSuccess: true,
              allPostsWithUser: value,
            ),
          );
        });

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
        error: () => null,
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
        _getSinglePostWithUser(post: data).then((value) {
          // If user is already in the cache, return it

          emit(
            state.copyWith(
              isLoading: false,
              isSuccess: true,
              selectedPostWithUser: () => value,
            ),
          );
        });

        if (onSuccess != null) {
          onSuccess();
        }

        if (navigation != null) {
          navigation();
        }
      },
    );
  }

  void toggleSearch(
    bool value,
  ) {
    emit(
      state.copyWith(
        isSearching: value,
        filteredPostsWithUser: value ? state.allPostsWithUser : const [],
      ),
    );
  }

  void filterPosts({
    required String query,
  }) {
    final filteredPostsWithUser = state.allPostsWithUser.where((postWithUser) {
      return postWithUser.post?.title?.toLowerCase().contains(
                    query.toLowerCase(),
                  ) ==
              true ||
          postWithUser.post?.body?.toLowerCase().contains(
                    query.toLowerCase(),
                  ) ==
              true ||
          postWithUser.user?.name
                  ?.toLowerCase()
                  .contains(query.toLowerCase()) ==
              true ||
          postWithUser.user?.username
                  ?.toLowerCase()
                  .contains(query.toLowerCase()) ==
              true;
    }).toList();
    emit(
      state.copyWith(
        filteredPostsWithUser: filteredPostsWithUser,
      ),
    );
  }

  void clearSearch() {
    emit(
      state.copyWith(
        filteredPostsWithUser: const [],
        isSearching: false,
        searchController: TextEditingController(),
      ),
    );
  }

  void selectPostWithUser({
    required PostWithUserEntity postWithUser,
  }) {
    emit(
      state.copyWith(
        selectedPostWithUser: () => postWithUser,
      ),
    );
  }

  final Map<int, UserEntity> _userCache = {};
  Future<PostWithUserEntity> _getSinglePostWithUser({
    required PostEntity post,
  }) async {
    if (post.userId == null) {
      log(
        "Fetching user data for post with id: ",
      );
      return PostWithUserEntity(
        post: post,
        user: null,
      );
    }
    if (_userCache.containsKey(post.userId)) {
      return PostWithUserEntity(
        post: post,
        user: _userCache[post.userId],
      );
    } else {
      // Fetch user data if not in cache
      final userData =
          await locator<GetSingleUserUsecase>().call(post.userId ?? 0);
      log(
        "Fetching user data for post with id: ${post.id} & user id : ${post.userId} \n User data: $userData",
      );
      return userData.fold(
        (error) => PostWithUserEntity(
          post: post,
          user: null,
        ),
        (user) {
          // Store fetched user data in cache
          _userCache[post.userId ?? 0] = user;
          return PostWithUserEntity(
            post: post,
            user: user,
          );
        },
      );
    }
  }

  Future<List<PostWithUserEntity>> _getAllPostWithUser({
    required List<PostEntity> posts,
  }) async {
    final List<Future<PostWithUserEntity>> futures = [];
    for (final post in posts) {
      futures.add(_getSinglePostWithUser(post: post));
    }
    return Future.wait(futures);
  }
}

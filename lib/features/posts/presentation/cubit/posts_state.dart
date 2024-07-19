import 'package:task_app/core/common/exports.dart';



class PostsState {
  final bool isLoading;
  final bool isSuccess;
  final AppErrorHandler? error;

  final List<PostEntity> allPosts;
  final PostEntity? selectedPost;

  final List<PostEntity> filteredPosts;

  final bool isSearching;

  final TextEditingController searchController;

  final List<PostWithUserEntity> allPostsWithUser;
  final PostWithUserEntity? selectedPostWithUser;
  final List<PostWithUserEntity> filteredPostsWithUser;

  PostsState({
    required this.isLoading,
    required this.isSuccess,
    this.error,
    required this.allPosts,
    this.selectedPost,
    required this.filteredPosts,
    required this.isSearching,
    required this.searchController,
    required this.allPostsWithUser,
    this.selectedPostWithUser,
    required this.filteredPostsWithUser,
  });

  factory PostsState.initial() {
    return PostsState(
      isLoading: false,
      isSuccess: false,
      error: null,
      allPosts: const [],
      selectedPost: null,
      filteredPosts: const [],
      isSearching: false,
      searchController: TextEditingController(),
      allPostsWithUser: const [],
      selectedPostWithUser: null,
      filteredPostsWithUser: const [],
    );
  }

  PostsState copyWith({
    bool? isLoading,
    bool? isSuccess,
    ValueGetter<AppErrorHandler?>? error,
    List<PostEntity>? allPosts,
    ValueGetter<PostEntity?>? selectedPost,
    List<PostEntity>? filteredPosts,
    bool? isSearching,
    TextEditingController? searchController,
    List<PostWithUserEntity>? allPostsWithUser,
    ValueGetter<PostWithUserEntity?>? selectedPostWithUser,
    List<PostWithUserEntity>? filteredPostsWithUser,
  }) {
    return PostsState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error != null ? error() : this.error,
      allPosts: allPosts ?? this.allPosts,
      selectedPost: selectedPost != null ? selectedPost() : this.selectedPost,
      filteredPosts: filteredPosts ?? this.filteredPosts,
      isSearching: isSearching ?? this.isSearching,
      searchController: searchController ?? this.searchController,
      allPostsWithUser: allPostsWithUser ?? this.allPostsWithUser,
      selectedPostWithUser: selectedPostWithUser != null
          ? selectedPostWithUser()
          : this.selectedPostWithUser,
      filteredPostsWithUser:
          filteredPostsWithUser ?? this.filteredPostsWithUser,
    );
  }

  @override
  String toString() {
    return 'PostsState(isLoading: $isLoading, isSuccess: $isSuccess, error: $error, allPosts: $allPosts, selectedPost: $selectedPost, filteredPosts: $filteredPosts, isSearching: $isSearching, searchController: $searchController, allPostsWithUser: $allPostsWithUser, selectedPostWithUser: $selectedPostWithUser, filteredPostsWithUser: $filteredPostsWithUser)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PostsState &&
        other.isLoading == isLoading &&
        other.isSuccess == isSuccess &&
        other.error == error &&
        listEquals(other.allPosts, allPosts) &&
        other.selectedPost == selectedPost &&
        listEquals(other.filteredPosts, filteredPosts) &&
        other.isSearching == isSearching &&
        other.searchController == searchController &&
        listEquals(other.allPostsWithUser, allPostsWithUser) &&
        other.selectedPostWithUser == selectedPostWithUser &&
        listEquals(other.filteredPostsWithUser, filteredPostsWithUser);
  }

  @override
  int get hashCode {
    return isLoading.hashCode ^
        isSuccess.hashCode ^
        error.hashCode ^
        allPosts.hashCode ^
        selectedPost.hashCode ^
        filteredPosts.hashCode ^
        isSearching.hashCode ^
        searchController.hashCode ^
        allPostsWithUser.hashCode ^
        selectedPostWithUser.hashCode ^
        filteredPostsWithUser.hashCode;
  }
}

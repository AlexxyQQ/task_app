import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'package:task_app/core/common/exports.dart';

class PostsState {
  final bool isLoading;
  final bool isSuccess;
  final AppErrorHandler? error;

  final List<PostsEntity> allPosts;
  final PostsEntity? selectedPost;

  final List<PostsEntity> filteredPosts;

  final bool isSearching;

  final TextEditingController searchController;

  PostsState({
    required this.isLoading,
    required this.isSuccess,
    this.error,
    required this.allPosts,
    this.selectedPost,
    required this.filteredPosts,
    required this.isSearching,
    required this.searchController,
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
    );
  }

  PostsState copyWith({
    bool? isLoading,
    bool? isSuccess,
    ValueGetter<AppErrorHandler?>? error,
    List<PostsEntity>? allPosts,
    ValueGetter<PostsEntity?>? selectedPost,
    List<PostsEntity>? filteredPosts,
    bool? isSearching,
    TextEditingController? searchController,
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
    );
  }

  @override
  String toString() {
    return 'PostsState(isLoading: $isLoading, isSuccess: $isSuccess, error: $error, allPosts: $allPosts, selectedPost: $selectedPost, filteredPosts: $filteredPosts, isSearching: $isSearching, searchController: $searchController)';
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
        other.searchController == searchController;
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
        searchController.hashCode;
  }
}

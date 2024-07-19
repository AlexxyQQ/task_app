import 'package:task_app/core/common/exports.dart';



class UserState {
  final bool isLoading;
  final bool isSuccess;
  final AppErrorHandler? error;

  final List<UserEntity> allUsers;
  final UserEntity? selectedUser;

  final bool isSearching;
  final TextEditingController searchController;

  final List<UserEntity> searchedUsers;

  UserState({
    required this.isLoading,
    required this.isSuccess,
    this.error,
    required this.allUsers,
    this.selectedUser,
    required this.isSearching,
    required this.searchController,
    required this.searchedUsers,
  });

  factory UserState.initial() {
    return UserState(
      isLoading: false,
      isSuccess: false,
      error: null,
      allUsers: const [],
      selectedUser: null,
      isSearching: false,
      searchController: TextEditingController(),
      searchedUsers: const [],
    );
  }

  UserState copyWith({
    bool? isLoading,
    bool? isSuccess,
    ValueGetter<AppErrorHandler?>? error,
    List<UserEntity>? allUsers,
    ValueGetter<UserEntity?>? selectedUser,
    bool? isSearching,
    TextEditingController? searchController,
    List<UserEntity>? searchedUsers,
  }) {
    return UserState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error != null ? error() : this.error,
      allUsers: allUsers ?? this.allUsers,
      selectedUser: selectedUser != null ? selectedUser() : this.selectedUser,
      isSearching: isSearching ?? this.isSearching,
      searchController: searchController ?? this.searchController,
      searchedUsers: searchedUsers ?? this.searchedUsers,
    );
  }

  @override
  String toString() {
    return 'UserState(isLoading: $isLoading, isSuccess: $isSuccess, error: $error, allUsers: $allUsers, selectedUser: $selectedUser, isSearching: $isSearching, searchController: $searchController, searchedUsers: $searchedUsers)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserState &&
        other.isLoading == isLoading &&
        other.isSuccess == isSuccess &&
        other.error == error &&
        listEquals(other.allUsers, allUsers) &&
        other.selectedUser == selectedUser &&
        other.isSearching == isSearching &&
        other.searchController == searchController &&
        listEquals(other.searchedUsers, searchedUsers);
  }

  @override
  int get hashCode {
    return isLoading.hashCode ^
        isSuccess.hashCode ^
        error.hashCode ^
        allUsers.hashCode ^
        selectedUser.hashCode ^
        isSearching.hashCode ^
        searchController.hashCode ^
        searchedUsers.hashCode;
  }
}

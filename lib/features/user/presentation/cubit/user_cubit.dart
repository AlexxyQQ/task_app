import 'package:task_app/core/common/exports.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({
    required this.getAllUsersUsecase,
    required this.getSingleUserUsecase,
  }) : super(UserState.initial());

  final GetAllUsersUsecase getAllUsersUsecase;
  final GetSingleUserUsecase getSingleUserUsecase;

  Future<void> getAllUser({
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
    final result = await getAllUsersUsecase.call(null);
    result.fold(
      (error) {
        emit(state.copyWith(
          isLoading: false,
          error: () => error,
          isSuccess: false,
        ));
        onError?.call(error.message);
      },
      (users) {
        emit(
          state.copyWith(
            isLoading: false,
            isSuccess: true,
            allUsers: users,
            error: () => null,
          ),
        );
        onSuccess?.call();
        navigation?.call();
      },
    );
  }

  Future<void> getSingleUser({
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
    final result = await getSingleUserUsecase.call(id);
    result.fold(
      (error) {
        emit(state.copyWith(
          isLoading: false,
          error: () => error,
          isSuccess: false,
        ));
        onError?.call(error.message);
      },
      (user) {
        emit(
          state.copyWith(
            isLoading: false,
            isSuccess: true,
            selectedUser: () => user,
            error: () => null,
          ),
        );
        onSuccess?.call();
        navigation?.call();
      },
    );
  }

  void clearSearch() {
    emit(
      state.copyWith(
        isSearching: false,
        searchedUsers: const [],
        searchController: TextEditingController(),
      ),
    );
  }

  void toggleSearch(
    bool value,
  ) {
    emit(
      state.copyWith(
        isSearching: value,
        searchedUsers: value ? state.allUsers : const [],
      ),
    );
  }

  void searchUser(String query) {
    final searchedUsers = state.allUsers
        .where((user) =>
            user.name?.toLowerCase().contains(query.toLowerCase()) == true ||
            user.username?.toLowerCase().contains(query.toLowerCase()) ==
                true ||
            user.email?.toLowerCase().contains(query.toLowerCase()) == true ||
            user.phone?.toLowerCase().contains(query.toLowerCase()) == true ||
            user.company?.name?.toLowerCase().contains(query.toLowerCase()) ==
                true ||
            user.company?.catchPhrase
                    ?.toLowerCase()
                    .contains(query.toLowerCase()) ==
                true ||
            user.address?.street?.toLowerCase().contains(query.toLowerCase()) ==
                true ||
            user.address?.city?.toLowerCase().contains(query.toLowerCase()) ==
                true ||
            user.address?.zipcode
                    ?.toLowerCase()
                    .contains(query.toLowerCase()) ==
                true ||
            user.address?.suite?.toLowerCase().contains(query.toLowerCase()) ==
                true ||
            user.website?.toLowerCase().contains(query.toLowerCase()) == true)
        .toList();
    emit(
      state.copyWith(
        isSearching: true,
        searchedUsers: searchedUsers,
      ),
    );
  }

  void selectUser({UserEntity? user}) {
    emit(
      state.copyWith(
        selectedUser: () => user,
      ),
    );
  }
}

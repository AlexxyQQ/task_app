import 'package:task_app/core/common/exports.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _PostsViewState();
}

class _PostsViewState extends State<UserView> {
  late UserCubit _userCubit;

  @override
  void initState() {
    super.initState();
    _userCubit = BlocProvider.of<UserCubit>(context);
    _userCubit.getAllUser(
      onError: (message) {
        kShowSnackBar(
          message: message,
          context: context,
          isError: true,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Stack(
            children: [
              Builder(
                builder: (context) {
                  final List<UserEntity> users =
                      state.isSearching ? state.allUsers : state.allUsers;
                  if (users.isEmpty && !state.isLoading) {
                    return const Center(
                      child: Text('No posts found'),
                    );
                  } else {
                    return RefreshIndicator(
                      onRefresh: () async {
                        _userCubit.getAllUser(onError: (message) {
                          kShowSnackBar(
                            message: message,
                            context: context,
                            isError: true,
                          );
                        });
                      },
                      child: ListView.builder(
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          final user = users[index];
                          return UserItemWidgets(
                            user: user,
                            UserCubit: _userCubit,
                          );
                        },
                      ),
                    );
                  }
                },
              ),
              // Loader
              if (state.isLoading) const Loader()
            ],
          ),
        );
      },
    );
  }
}

class UserItemWidgets extends StatelessWidget {
  const UserItemWidgets({
    super.key,
    required this.user,
    required UserCubit UserCubit,
  }) : _UserCubit = UserCubit;

  final UserEntity user;
  final UserCubit _UserCubit;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        user.name.toTitleCase(
          nullValue: 'N/A',
        ),
        style: AllTextStyle.f16W6,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        user.email ?? 'N/A',
        style: AllTextStyle.f14W4,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      // onTap: () {
      //   _UserCubit.getSinglePost(
      //     id: user.post?.id ?? 0,
      //     onError: (message) {
      //       kShowSnackBar(
      //         message: message,
      //         context: context,
      //         isError: true,
      //       );
      //     },
      //     navigation: () {
      //       Navigator.pushNamed(
      //         context,
      //         AppRoutes.postDetailPageRoute,
      //       );
      //     },
      //   );
      // },
    );
  }

  _postPopupView(
    BuildContext context,
  ) {
    return showDialog(
      context: context,
      builder: (context) {
        return const PostPopUpView();
      },
    );
  }
}

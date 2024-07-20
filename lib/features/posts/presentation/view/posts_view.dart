import 'package:task_app/core/common/exports.dart';

class PostsView extends StatefulWidget {
  const PostsView({super.key});

  @override
  State<PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  late PostsCubit _postsCubit;

  @override
  void initState() {
    super.initState();
    _postsCubit = BlocProvider.of<PostsCubit>(context);
    _postsCubit.getAllPosts(
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
    return BlocBuilder<PostsCubit, PostsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: PostsAppBar(state: state),
          body: Stack(
            children: [
              Builder(
                builder: (context) {
                  final List<PostWithUserEntity> postWithUser =
                      state.isSearching
                          ? state.filteredPostsWithUser
                          : state.allPostsWithUser;
                  if (postWithUser.isEmpty && !state.isLoading) {
                    return const Center(
                      child: Text('No posts found'),
                    );
                  } else {
                    return RefreshIndicator(
                      onRefresh: () async {
                        _postsCubit.getAllPosts();
                      },
                      child: ListView.separated(
                        separatorBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                          ),
                          child: const Divider(
                            color: PrimitiveColors.grey700,
                          ),
                        ),
                        itemCount: postWithUser.length,
                        itemBuilder: (context, index) {
                          final post = postWithUser[index];
                          return PostItemWidgets(
                            postWithUser: post,
                            postsCubit: _postsCubit,
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

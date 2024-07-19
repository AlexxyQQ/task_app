import 'package:task_app/core/common/exports.dart';
import 'package:task_app/core/utils/extensions/title_case_extension.dart';
import 'package:task_app/features/posts/presentation/widget/post_popup_view.dart';

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
                  final List<PostsEntity> posts =
                      state.isSearching ? state.filteredPosts : state.allPosts;
                  if (posts.isEmpty && !state.isLoading) {
                    return const Center(
                      child: Text('No posts found'),
                    );
                  } else {
                    return RefreshIndicator(
                      onRefresh: () async {
                        _postsCubit.getAllPosts();
                      },
                      child: ListView.builder(
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          final post = posts[index];
                          return PostItemWidgets(
                            post: post,
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

class PostItemWidgets extends StatelessWidget {
  const PostItemWidgets({
    super.key,
    required this.post,
    required PostsCubit postsCubit,
  }) : _postsCubit = postsCubit;

  final PostsEntity post;
  final PostsCubit _postsCubit;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        post.title ?? '',
        style: AllTextStyle.f16W6,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        post.body ?? '',
        style: AllTextStyle.f14W4,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      onLongPress: () {
        // Show a popup view
        _postPopupView(context);
      },
      onTap: () {
        _postsCubit.getSinglePost(
          id: post.id ?? 0,
          onError: (message) {
            kShowSnackBar(
              message: message,
              context: context,
              isError: true,
            );
          },
          navigation: () {
            Navigator.pushNamed(
              context,
              AppRoutes.postDetailPageRoute,
            );
          },
        );
      },
    );
  }

  _postPopupView(
    BuildContext context,
  ) {
    return showDialog(
      context: context,
      builder: (context) {
        return PostPopUpView();
      },
    );
  }
}

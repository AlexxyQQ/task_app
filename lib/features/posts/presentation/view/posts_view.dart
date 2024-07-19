import 'package:flutter/cupertino.dart';
import 'package:task_app/core/common/exports.dart';

class PostsView extends StatefulWidget {
  const PostsView({super.key});

  @override
  State<PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  late PostsCubit _postsCubit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
                  if (posts.isEmpty) {
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

class PostsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final PostsState state;

  const PostsAppBar({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return state.isSearching
        ? AppBar(
            backgroundColor: AppColors().primaryFixedDim,
            toolbarHeight: 100.h,
            flexibleSpace: Container(
              margin: EdgeInsets.only(top: 40.h),
              height: 80.h,
              width: 1.sw,
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Back Button
                  CupertinoButton(
                    onPressed: () {
                      BlocProvider.of<PostsCubit>(context).searchToggle(
                        false,
                      );
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 0.8.sw,
                    child: TextFormField(
                      controller: state.searchController,
                      onChanged: (value) {
                        BlocProvider.of<PostsCubit>(context).filterPosts(
                          query: value,
                        );
                      },
                      style: AllTextStyle.f16W6,
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: AllTextStyle.f14W8,
                        fillColor: Colors.white,
                        filled: true,
                        suffixIcon: state.searchController.text.isNotEmpty
                            ? IconButton(
                                onPressed: () {
                                  BlocProvider.of<PostsCubit>(context)
                                      .clearSearch();
                                },
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.grey,
                                ),
                              )
                            : null,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 10.h,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            leadingWidth: 0,
            leading: Container(),
          )
        : AppBar(
            backgroundColor: AppColors().primaryFixedDim,
            toolbarHeight: 100.h,
            leadingWidth: 0,
            leading: null,
            title: Text(
              'Posts',
              style: AllTextStyle.f20W8.copyWith(
                color: Colors.white,
              ),
            ),
            actions: [
              CupertinoButton(
                onPressed: () {
                  BlocProvider.of<PostsCubit>(context).searchToggle(
                    true,
                  );
                },
                child: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ],
          );
  }

  @override
  Size get preferredSize => Size.fromHeight(100.h);
}

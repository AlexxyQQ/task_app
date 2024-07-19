import 'package:task_app/core/common/exports.dart';
import 'package:flutter/cupertino.dart';

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
                      BlocProvider.of<PostsCubit>(context).toggleSearch(
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
        : CustomAppBar(
            title: "Post",
            actions: [
              CupertinoButton(
                onPressed: () {
                  BlocProvider.of<PostsCubit>(context).toggleSearch(
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

import 'package:task_app/core/common/exports.dart';

class PostPopUpView extends StatefulWidget {
  const PostPopUpView({super.key});

  @override
  State<PostPopUpView> createState() => _PostPopUpViewState();
}

class _PostPopUpViewState extends State<PostPopUpView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit, PostsState>(
      builder: (context, state) {
        if (state.selectedPostWithUser == null) {
          return const SizedBox.shrink();
        }
        return AlertDialog(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 0.w,
            vertical: 0.h,
          ),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          content: SizedBox(
            height: 350.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _postContents(state),
                // Bottom Actions
                SizedBox(
                  height: 16.h,
                ),
                _actionButtons(),
              ],
            ),
          ),
        );
      },
    );
  }

  Container _actionButtons() {
    return Container(
      decoration: BoxDecoration(
        color: PrimitiveColors.grey200,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12.r),
          bottomRight: Radius.circular(12.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Heart Icon
          IconButton(
            onPressed: () {
              // context.read<PostsCubit>().toggleFavouritePost();
            },
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
              // state.selectedPostWithUser!.post?.isFavourite
              //     ? Icons.favorite
              //     : Icons.favorite_border,
              // color: state.selectedPostWithUser!.post?.isFavourite
              //     ? PrimitiveColors.red
              //     : PrimitiveColors.grey400,
            ),
            iconSize: 24.w,
          ),
          // Comment Icon
          IconButton(
            onPressed: () {
              BlocProvider.of<CommentCubit>(context).getAllComments(
                postId: BlocProvider.of<PostsCubit>(context)
                        .state
                        .selectedPostWithUser!
                        .post
                        ?.id ??
                    0,
                onSuccess: () {
                  Navigator.of(context).pop();
                  commentBottomSheet(
                    context,
                    BlocProvider.of<PostsCubit>(context)
                            .state
                            .selectedPostWithUser!
                            .post
                            ?.id ??
                        0,
                  );
                },
              );
            },
            icon: const Icon(
              Icons.comment,
              color: PrimitiveColors.grey1000,
            ),
            iconSize: 24.w,
          ),
          // More Icon
          IconButton(
            onPressed: () {
              // context.read<PostsCubit>().toggleFavouritePost();
            },
            icon: const Icon(
              Icons.more_vert,
              color: PrimitiveColors.grey1000,
            ),
            iconSize: 24.w,
          ),
        ],
      ),
    );
  }

  Column _postContents(PostsState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Row(
            children: [
              Container(
                width: 32.w,
                height: 32.h,
                decoration: BoxDecoration(
                  color: AppColors(inverseDarkMode: true).primaryContainer,
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: Center(
                  child: Text(
                    state.selectedPostWithUser!.user?.username
                            ?.substring(0, 1)
                            .toTitleCase(nullValue: "U") ??
                        'U',
                    style: AllTextStyle.f14W8.copyWith(
                      color: PrimitiveColors.grey1000,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
              Text(
                state.selectedPostWithUser!.user?.username?.toTitleCase() ??
                    'N/A',
                style: AllTextStyle.f14W8,
              ),
            ],
          ),
        ),
        // Divider
        Divider(
          color: PrimitiveColors.grey200,
          thickness: 0.5.h,
        ),
        SizedBox(
          height: 8.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.selectedPostWithUser!.post?.title.toTitleCase(
                      nullValue: 'N/A',
                    ) ??
                    'N/A',
                style: AllTextStyle.f16W8,
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                state.selectedPostWithUser!.post?.body ?? 'N/A',
                style: AllTextStyle.f14W5.copyWith(
                  color: PrimitiveColors.grey400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

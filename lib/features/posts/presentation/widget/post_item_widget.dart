import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:task_app/core/common/exports.dart';
import 'package:task_app/features/comment/presentation/widget/comment_bottom_sheet.dart';

class PostItemWidgets extends StatelessWidget {
  const PostItemWidgets({
    super.key,
    required this.postWithUser,
    required PostsCubit postsCubit,
  }) : _postsCubit = postsCubit;

  final PostWithUserEntity postWithUser;
  final PostsCubit _postsCubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 14.h,
      ),
      child: Column(
        children: [
          // User Info
          _userInfo(),
          SizedBox(
            height: 8.h,
          ),
          // Post Info
          _postInfo(context),
          // Actions
          _actionButtons(
            context,
            postWithUser,
          ),
        ],
      ),
    );
  }

  _actionButtons(
    BuildContext context,
    PostWithUserEntity postWithUser,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Heart Icon
        IconButton(
          onPressed: () {
            // context.read<PostsCubit>().toggleFavouritePost();
          },
          icon: const Icon(
            Icons.favorite_outline,
            color: PrimitiveColors.grey700,
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
              postId: postWithUser.post?.id ?? 0,
              onSuccess: () {
                commentBottomSheet(context);
              },
            );
          },
          icon: const Icon(
            Icons.comment,
            color: PrimitiveColors.grey700,
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
            color: PrimitiveColors.grey700,
          ),
          iconSize: 24.w,
        ),
      ],
    );
  }

  _postInfo(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        // Show a popup view
        BlocProvider.of<PostsCubit>(context)
            .selectPostWithUser(postWithUser: postWithUser);
        log('Post Selected $postWithUser');
        _postPopupView(context);
      },
      onTap: () {
        _postsCubit.getSinglePost(
          id: postWithUser.post?.id ?? 0,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Post Title
          Text(
            postWithUser.post?.title ?? '',
            style: AllTextStyle.f16W6,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 8.h,
          ),
          // Post Body
          Text(
            postWithUser.post?.body ?? '',
            style: AllTextStyle.f14W4,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  _userInfo() {
    return Row(
      children: [
        // User Avatar
        Container(
          width: 32.w,
          height: 32.h,
          decoration: BoxDecoration(
            color: PrimitiveColors.secondary300,
            borderRadius: BorderRadius.circular(25.r),
          ),
          child: Center(
            child: Text(
              postWithUser.user?.username
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
        // User Name
        Text(
          postWithUser.user?.username.toTitleCase(
                nullValue: 'N/A',
              ) ??
              '',
          style: AllTextStyle.f12W4.copyWith(
            color: PrimitiveColors.grey400,
          ),
        ),
      ],
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

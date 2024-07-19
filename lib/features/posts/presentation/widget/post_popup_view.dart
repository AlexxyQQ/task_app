import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:task_app/core/common/custom_widgets/custom_bottom_sheet.dart';
import 'package:task_app/core/common/exports.dart';
import 'package:task_app/core/utils/extensions/title_case_extension.dart';
import 'package:task_app/features/comment/presentation/widget/comment_section_widget.dart';

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
        if (state.selectedPost == null) {
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
            height: 300.w,
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
              // state.selectedPost!.isFavourite
              //     ? Icons.favorite
              //     : Icons.favorite_border,
              // color: state.selectedPost!.isFavourite
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
                        .selectedPost
                        ?.id ??
                    0,
                onSuccess: () {
                  Navigator.of(context).pop();
                  kBottomSheet(
                    context: context,
                    title: 'Comments',
                    height: 0.7.sh,
                    child: const CommentSectionWidget(
                      showTitle: false,
                    ),
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
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Text(
            state.selectedPost!.title!.toTitleCase(),
            style: AllTextStyle.f16W8,
          ),
        ),
        // Divider
        Divider(
          color: PrimitiveColors.grey200,
          thickness: 0.5.h,
        ),
        SizedBox(
          height: 12.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          child: Text(
            state.selectedPost!.body ?? 'N/A',
            style: AllTextStyle.f14W5.copyWith(
              color: PrimitiveColors.grey400,
            ),
          ),
        ),
      ],
    );
  }
}

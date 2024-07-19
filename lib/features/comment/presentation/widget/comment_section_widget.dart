import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:task_app/core/common/exports.dart';
import 'package:task_app/core/utils/extensions/title_case_extension.dart';

class CommentSectionWidget extends StatefulWidget {
  const CommentSectionWidget({super.key});

  @override
  State<CommentSectionWidget> createState() => _CommentSectionWidgetState();
}

class _CommentSectionWidgetState extends State<CommentSectionWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentCubit, CommentState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: Loader(
              opacity: 0,
            ),
          );
        }
        if (!state.isSuccess || state.comments.isEmpty) {
          return Center(
            child: Text(
              "No Comments",
              style: AllTextStyle.f16W6.copyWith(
                color: PrimitiveColors.grey400,
              ),
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Comments",
              style: AllTextStyle.f16W8,
            ),
            SizedBox(
              height: 12.h,
            ),
            SizedBox(
              height: 550.h,
              child: RefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<CommentCubit>(context).getAllComments(
                    postId: BlocProvider.of<PostsCubit>(context)
                            .state
                            .selectedPost
                            ?.id ??
                        0,
                    onError: (message) {
                      kShowSnackBar(
                        message: message,
                        context: context,
                        isError: true,
                      );
                    },
                  );
                },
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...state.comments.map(
                        (comment) {
                          return CommentItemWidget(
                            comment: comment,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class CommentItemWidget extends StatelessWidget {
  final CommentEntity comment;

  const CommentItemWidget({
    super.key,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 20.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 6.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Commentator Image
          Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: PrimitiveColors.secondary300,
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: Center(
              child: Text(
                comment.name?.substring(0, 1).toTitleCase(nullValue: "U") ??
                    'U',
                style: AllTextStyle.f20W8.copyWith(
                  color: PrimitiveColors.grey1000,
                ),
              ),
            ),
          ),

          SizedBox(
            width: 12.w,
          ),

          SizedBox(
            width: 320.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Commentator Email
                Text(
                  comment.email ?? 'N/A',
                  style: AllTextStyle.f14W6.copyWith(
                    color: PrimitiveColors.grey700,
                  ),
                ),
                Text(
                  comment.name.toTitleCase(
                    nullValue: "N/A",
                  ),
                  style: AllTextStyle.f16W6.copyWith(
                    color: PrimitiveColors.grey100,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  comment.body.toTitleCase(
                    nullValue: "N/A",
                  ),
                  style: AllTextStyle.f14W4.copyWith(
                    color: PrimitiveColors.grey300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

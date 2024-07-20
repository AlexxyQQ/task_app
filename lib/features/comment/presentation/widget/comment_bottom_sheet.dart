import 'package:task_app/core/common/exports.dart';

commentBottomSheet(
  BuildContext context,
  int postId,
) {
  final TextEditingController commentController = TextEditingController();
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return FractionallySizedBox(
        heightFactor: 0.9,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Text(
                  'Comments',
                  style: AllTextStyle.f18W6,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CommentSectionWidget(
                        showTitle: false,
                        height: 0.78.sh,
                        postId: postId,
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                height: 1,
                thickness: 1,
              ),
              // Post Comment Text Field
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 10.h,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: commentController,
                        decoration: InputDecoration(
                          hintText: 'Write a comment...',
                          hintStyle: AllTextStyle.f14W4.copyWith(
                            color: PrimitiveColors.grey400,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        if (commentController.text.isEmpty) {
                          return;
                        }
                        await BlocProvider.of<CommentCubit>(context)
                            .postComment(
                          postId: postId,
                          name: 'John Doe',
                          email: "JohjDoe@example.com",
                          body: commentController.text,
                          onSuccess: () {
                            commentController.clear();
                            kShowSnackBar(
                              message: 'Comment posted successfully',
                              context: context,
                            );
                          },
                          onError: (message) {
                            kShowSnackBar(
                              message: message,
                              context: context,
                              isError: true,
                            );
                          },
                        );
                      },
                      icon: const Icon(
                        Icons.send,
                        color: PrimitiveColors.grey700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

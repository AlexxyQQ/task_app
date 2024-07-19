import 'package:task_app/core/common/exports.dart';
import 'package:task_app/features/comment/presentation/widget/comment_section_widget.dart';

class PostDetailPage extends StatefulWidget {
  const PostDetailPage({super.key});

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CommentCubit>(context).getAllComments(
      postId: BlocProvider.of<PostsCubit>(context).state.selectedPost?.id ?? 0,
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
        if (state.selectedPost == null) {
          return const Scaffold(
            appBar: CustomAppBar(
              title: 'Post Detail',
              showBackButton: true,
            ),
            body: Center(
              child: Text("Post Not Found"),
            ),
          );
        }
        return Scaffold(
          appBar: const CustomAppBar(
            title: 'Post Detail',
            showBackButton: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 20.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title of the Post
                Text(
                  state.selectedPost?.title ?? 'N/A',
                  style: AllTextStyle.f16W6,
                ),
                SizedBox(
                  height: 12.h,
                ),
                // Body of the Post
                Text(
                  state.selectedPost?.body ?? 'N/A',
                  style: AllTextStyle.f14W4,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CommentSectionWidget(),
              ],
            ),
          ),
        );
      },
    );
  }
}

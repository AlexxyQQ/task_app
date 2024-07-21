import 'package:task_app/core/common/exports.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PostsCubit>(context).getAllPosts(onError: (error) {
      kShowSnackBar(
        context: context,
        message: error,
        isError: true,
      );
    });
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, AppRoutes.allPostPageRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Task App',
          style: AllTextStyle.f32W8.copyWith(
            color: AppColors().primary,
          ),
        ),
      ),
    );
  }
}

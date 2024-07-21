import 'package:task_app/core/common/exports.dart';

class AppRoutes {
  // Initial Route
  static const String initialRoute = '/';
  static const String unknownRoute = '/unknown';

  // Post Routes
  static const String allPostPageRoute = '/allPostPage';
  static const String postDetailPageRoute = '/postDetailPageRoute';

  // User Routes
  static const String userDetailPageRoute = '/userDetailPageRoute';

  // List of all routes
  static final Map<String, Widget Function(BuildContext)> routes = {
    initialRoute: (context) => const SplashView(),
    // Post Routes
    allPostPageRoute: (context) => const PostsView(),
    postDetailPageRoute: (context) => const PostDetailPage(),
    // User Routes
    userDetailPageRoute: (context) => const UserDetailPage(),
  };

  // onGenerateRoute
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    if (routes.containsKey(settings.name)) {
      // Get the function to create the route
      final routeBuilder = routes[settings.name];
      return MaterialPageRoute(builder: (context) => routeBuilder!(context));
    } else {
      // If the route is not found, navigate to unknownRoute
      return MaterialPageRoute(
        builder: (context) => const NoRoutePage(),
      );
    }
  }
}

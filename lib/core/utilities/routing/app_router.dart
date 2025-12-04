import 'package:bookly_app/core/utilities/routing/routes.dart';
import 'package:bookly_app/features/home/UI/views/home_view.dart';
import 'package:bookly_app/features/splash/UI/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.splashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: Routes.homeView,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}

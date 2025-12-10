import 'package:bookly_app/core/utilities/routing/routes.dart';
import 'package:bookly_app/core/utilities/server%20locator/dependency_injection.dart';
import 'package:bookly_app/features/home/UI/view%20models/related_books_cubit/related_books_cubit.dart';
import 'package:bookly_app/features/home/UI/views/book_details_view.dart';
import 'package:bookly_app/features/home/UI/views/home_view.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repo/home_repo_implementaion.dart';
import 'package:bookly_app/features/search/UI/search_view.dart';
import 'package:bookly_app/features/splash/UI/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      // Splash View Route
      GoRoute(
        path: Routes.splashView,
        builder: (context, state) => const SplashView(),
      ),
      // Home View Route
      GoRoute(
        path: Routes.homeView,
        builder: (context, state) => const HomeView(),
      ),
      // Book Details View Route
      GoRoute(
        path: Routes.bookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              RelatedBooksCubit(getIt.get<HomeRepoImplementation>()),
          child: BookDetailsView(book: state.extra as BookModel),
        ),
      ),
      // Search View Route
      GoRoute(
        path: Routes.searchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}

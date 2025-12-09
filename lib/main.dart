import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utilities/routing/app_router.dart';
import 'package:bookly_app/core/utilities/server%20locator/dependency_injection.dart';
import 'package:bookly_app/features/home/data/repo/home_repo_implementaion.dart';
import 'package:bookly_app/features/splash/UI/view%20models/featured%20books%20cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/splash/UI/view%20models/latest%20books%20cubit/latest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setUpGetIt();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubit(getIt.get<HomeRepoImplementation>())
                ..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) =>
              LatestBooksCubit(getIt.get<HomeRepoImplementation>())
                ..fetchLatestBooks(),
        ),
      ],

      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(kPrimaryColor),
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
      ),
    );
  }
}

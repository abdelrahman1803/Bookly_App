import 'package:bookly_app/core/shimmer/placeholders/book_cover_shimmer.dart';
import 'package:bookly_app/core/utilities/routing/routes.dart';
import 'package:bookly_app/core/utilities/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/UI/view%20models/related_books_cubit/related_books_cubit.dart';
import 'package:bookly_app/features/home/UI/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RelatedBooksCubit, RelatedBooksState>(
      builder: (context, state) {
        if (state is RelatedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.separated(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    GoRouter.of(
                      context,
                    ).push(Routes.bookDetailsView, extra: state.books[index]);
                  },
                  child: CustomBookItem(
                    imageUrl:
                        state.books[index].volumeInfo!.imageLinks!.thumbnail!,
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(width: 6),
            ),
          );
        } else if (state is RelatedBooksFailure) {
          return CustomErrorWidget(
            errMessage: state.errMessage,
            onRetry: () =>
                context.read<RelatedBooksCubit>().retryFetchRelatedBooks(),
          );
        } else {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.separated(
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return const BookCoverShimmer(width: 85, height: 120);
              },
              separatorBuilder: (context, index) => const SizedBox(width: 6),
            ),
          );
        }
      },
    );
  }
}

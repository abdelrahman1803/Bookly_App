import 'package:bookly_app/core/shimmer/placeholders/featured_list_item_shimmer.dart';
import 'package:bookly_app/core/utilities/routing/routes.dart';
import 'package:bookly_app/core/utilities/widgets/custom_error_image_widget.dart';
import 'package:bookly_app/core/utilities/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/UI/view%20models/featured%20books%20cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/UI/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        builder: (context, state) {
          if (state is FeaturedBooksSuccess) {
            return ListView.separated(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                final imageUrl =
                    state.books[index].volumeInfo?.imageLinks?.thumbnail;
                return imageUrl != null && imageUrl.isNotEmpty
                    ? GestureDetector(
                        onTap: () => GoRouter.of(context).push(
                          Routes.bookDetailsView,
                          extra: state.books[index],
                        ),
                        child: CustomBookItem(imageUrl: imageUrl),
                      )
                    : const ErrorImageWidget();
              },
              separatorBuilder: (context, index) => SizedBox(width: 10),
            );
          } else if (state is FeaturedBooksFailure) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CustomErrorWidget(
                errMessage: state.errMessage,
                onRetry: () =>
                    context.read<FeaturedBooksCubit>().fetchFeaturedBooks(),
              ),
            );
          } else {
            return ListView.separated(
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) =>
                  const FeaturedListItemShimmer(),
              separatorBuilder: (context, index) => const SizedBox(width: 10),
            );
          }
        },
      ),
    );
  }
}

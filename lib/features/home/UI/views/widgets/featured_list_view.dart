import 'package:bookly_app/core/utilities/widgets/custom_error_image_widget.dart';
import 'package:bookly_app/core/utilities/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/utilities/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/UI/views/widgets/custom_book_item.dart';
import 'package:bookly_app/features/splash/UI/view%20models/featured%20books%20cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        builder: (context, state) {
          if (state is FeaturedBooksSuccess) {
            return ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                final imageUrl =
                    state.books[index].volumeInfo?.imageLinks?.thumbnail;

                return imageUrl != null && imageUrl.isNotEmpty
                    ? CustomBookItem(imageUrl: imageUrl)
                    : const ErrorImageWidget();
              },
            );
          } else if (state is FeaturedBooksFailure) {
            return CustomErrorWidget(
              errMessage: state.errMessage,
              onRetry: () =>
                  context.read<FeaturedBooksCubit>().fetchFeaturedBooks(),
            );
          } else {
            return const CustomLoadingIndicator();
          }
        },
      ),
    );
  }
}

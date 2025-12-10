import 'package:bookly_app/core/utilities/widgets/custom_error_image_widget.dart';
import 'package:bookly_app/core/utilities/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/core/utilities/widgets/widget_error.dart';
import 'package:bookly_app/features/home/UI/views/widgets/custom_book_item.dart';
import 'package:bookly_app/features/home/UI/view%20models/featured%20books%20cubit/featured_books_cubit.dart';
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
            return ListView.separated(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                final imageUrl =
                    state.books[index].volumeInfo?.imageLinks?.thumbnail;
                return imageUrl != null && imageUrl.isNotEmpty
                    ? CustomBookItem(imageUrl: imageUrl)
                    : const ErrorImageWidget();
              },
              separatorBuilder: (context, index) => SizedBox(width: 10),
            );
          } else if (state is FeaturedBooksFailure) {
            return WidgetError(errMessage: state.errMessage);
          } else {
            return const CustomLoadingIndicator();
          }
        },
      ),
    );
  }
}


class ImageUrlHandler extends StatelessWidget {
  final dynamic model;
  final int index;

  const ImageUrlHandler({
    super.key,
    required this.model,
    required this.index,
  });

  Widget _imageUrlHandler() {
    final String? imageUrl =
        model.books[index].volumeInfo?.imageLinks?.thumbnail;

    return (imageUrl != null && imageUrl.isNotEmpty)
        ? CustomBookItem(imageUrl: imageUrl)
        : const ErrorImageWidget();
  }

  @override
  Widget build(BuildContext context) {
    return _imageUrlHandler();
  }
}


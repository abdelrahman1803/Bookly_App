import 'package:bookly_app/core/shimmer/placeholders/vertical_book_list_item_shimmer.dart';
import 'package:bookly_app/core/utilities/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/UI/view%20models/latest%20books%20cubit/latest_books_cubit.dart';
import 'package:bookly_app/features/home/UI/views/widgets/book_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LatestBooksListView extends StatelessWidget {
  const LatestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LatestBooksCubit, LatestBooksState>(
      builder: (context, state) {
        if (state is LatestBooksSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: BookListViewItem(book: state.books[index]),
              );
            },
          );
        } else if (state is LatestBooksFailure) {
          return CustomErrorWidget(
            errMessage: state.errMessage,
            onRetry: () => context.read<LatestBooksCubit>().fetchLatestBooks(),
          );
        } else {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: VerticalBookListItemShimmer(),
              );
            },
          );
        }
      },
    );
  }
}

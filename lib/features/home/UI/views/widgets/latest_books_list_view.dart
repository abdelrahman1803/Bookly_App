import 'package:bookly_app/core/utilities/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/utilities/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/UI/views/widgets/book_list_view_item.dart';
import 'package:bookly_app/features/splash/UI/view%20models/latest%20books%20cubit/latest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LatestBooksListView extends StatelessWidget {
  const LatestBooksListView({super.key, required bookModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LatestBooksCubit, LatestBooksState>(
      builder: (context, state) {
        if (state is LatestBooksSuccess) {
          return ListView.builder(
            // shrinkWrap: true, //used with sliverToBoxAdapter()
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: BookListViewItem(bookModel: state.books[index]),
              );
            },
          );
        } else if (state is LatestBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}

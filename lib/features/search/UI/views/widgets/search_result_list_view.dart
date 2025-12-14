import 'package:bookly_app/core/utilities/styles.dart';
import 'package:bookly_app/core/utilities/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/utilities/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/UI/views/widgets/book_list_view_item.dart';
import 'package:bookly_app/features/search/UI/view%20models/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const CustomLoadingIndicator();
        }

        if (state is SearchSuccess) {
          if (state.books.isEmpty) {
            return const Center(
              child: Text('No result found', style: Styles.textStyle16),
            );
          }
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: BookListViewItem(book: state.books[index]),
              );
            },
          );
        }

        if (state is SearchFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        }

        return const Center(
          child: Text('Write a book name', style: Styles.textStyle16),
        );
      },
    );
  }
}

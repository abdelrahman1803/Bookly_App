import 'package:bookly_app/core/utilities/styles.dart';
import 'package:bookly_app/features/home/UI/views/widgets/book_list_view_item.dart';
import 'package:bookly_app/features/search/UI/views/widgets/custom_search_text_field.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSearchTextField(),
            const SizedBox(height: 10),
            Text(
              "Results:",
              style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(child: SearchResultListView()),
          ],
        ),
      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: BookListViewItem(),
        );
      },
    );
  }
}

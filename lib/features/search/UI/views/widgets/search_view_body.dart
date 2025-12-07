import 'package:bookly_app/core/utilities/styles.dart';
import 'package:bookly_app/features/search/UI/views/widgets/custom_search_text_field.dart';
import 'package:bookly_app/features/search/UI/views/widgets/search_result_list_view.dart';
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

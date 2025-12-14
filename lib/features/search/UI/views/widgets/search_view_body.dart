import 'package:bookly_app/core/utilities/server%20locator/dependency_injection.dart';
import 'package:bookly_app/core/utilities/styles.dart';
import 'package:bookly_app/features/search/UI/view%20models/cubit/search_cubit.dart';
import 'package:bookly_app/features/search/UI/views/widgets/custom_search_text_field.dart';
import 'package:bookly_app/features/search/UI/views/widgets/search_result_list_view.dart';
import 'package:bookly_app/features/search/data/repo/search_repo_implementation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(getIt.get<SearchRepoImplementation>()),
      child: Scaffold(
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
              const Expanded(child: SearchResultListView()),
            ],
          ),
        ),
      ),
    );
  }
}

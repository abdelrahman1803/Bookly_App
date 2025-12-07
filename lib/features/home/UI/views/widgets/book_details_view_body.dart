import 'package:bookly_app/features/home/UI/views/widgets/books_details_section.dart';
import 'package:bookly_app/features/home/UI/views/widgets/custom_book_deatails_app_bar.dart';
import 'package:bookly_app/features/home/UI/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverFillRemaining(
          child: Column(
            children: [
              const CustomBookDetailsAppBar(),
              const BookDetailsSection(),
              const SizedBox(height: 16),
              SimilarBooksSection(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ],
    );
  }
}

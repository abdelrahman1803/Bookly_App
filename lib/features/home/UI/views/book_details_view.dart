import 'package:bookly_app/features/home/UI/view%20models/related_books_cubit/related_books_cubit.dart';
import 'package:bookly_app/features/home/UI/views/widgets/book_details_view_body.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.book});
  final BookModel book;
  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<RelatedBooksCubit>(
      context,
    ).fetchRelatedBooks(category: widget.book.volumeInfo!.categories![0]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BookDetailsViewBody(book: widget.book)),
    );
  }
}

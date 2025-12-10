import 'package:bookly_app/core/utilities/styles.dart';
import 'package:bookly_app/features/home/UI/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/UI/views/widgets/books_action.dart';
import 'package:bookly_app/features/home/UI/views/widgets/custom_book_item.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: CustomBookItem(
            imageUrl: book.volumeInfo!.imageLinks!.thumbnail!,
          ),
        ),
        const SizedBox(height: 30),
        Text(
          book.volumeInfo!.title!,
          style: Styles.textStyle30,
          textAlign: TextAlign.center,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            book.volumeInfo!.authors?.join(", ") ?? "Writer Name not Available",
            style: Styles.textStyle18.copyWith(fontStyle: FontStyle.italic),
          ),
        ),
        const SizedBox(height: 10),
        const BookRating(mainAxisAlignment: MainAxisAlignment.center),
        const SizedBox(height: 30),
        const BooksAction(),
      ],
    );
  }
}

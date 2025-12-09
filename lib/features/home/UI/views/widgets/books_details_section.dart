import 'package:bookly_app/core/utilities/styles.dart';
import 'package:bookly_app/features/home/UI/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/UI/views/widgets/books_action.dart';
import 'package:bookly_app/features/home/UI/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: const CustomBookItem(imageUrl: 'https://scontent.fcai19-1.fna.fbcdn.net/v/t39.30808-6/465796954_1740435256809270_7751944406033086737_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=QK0xaWA0mbMQ7kNvwE_tEdw&_nc_oc=Adl0o7anLgiNkiB4LL3QNpKaAv11ivfFecbcEOHFikvKpIjwsNdmaOUWQZhJoslbaRI&_nc_zt=23&_nc_ht=scontent.fcai19-1.fna&_nc_gid=iY-LX4rvKqHyCrvTuKfkMg&oh=00_AfndDF7jZjLyXbMwOFx_Wdqqys6VlVMIVZbjBMOOmguvMA&oe=693E341B',),
        ),
        const SizedBox(height: 30),
        const Text("The Jungle Book", style: Styles.textStyle30),
        Opacity(
          opacity: 0.7,
          child: Text(
            "Writer Name",
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

import 'package:bookly_app/constats.dart';
import 'package:bookly_app/core/utilities/assets.dart';
import 'package:bookly_app/core/utilities/routing/routes.dart';
import 'package:bookly_app/core/utilities/styles.dart';
import 'package:bookly_app/features/home/UI/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(Routes.bookDetailsView),
      child: SizedBox(
        height: 100,
        child: Row(
          children: [
            SizedBox(
              // height: 100,
              child: AspectRatio(
                aspectRatio: 0.7,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AssetsData.testImage),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      "Harry Potter and the Goblet of Fire",
                      style: Styles.textStyle20.copyWith(
                        fontFamily: kGtSectraFine,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 3),
                    child: Text("Writer Name", style: Styles.textStyle14),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "19.99 £",
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const BookRating(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:bookly_app/core/utilities/assets.dart';
import 'package:bookly_app/core/utilities/styles.dart';
import 'package:bookly_app/features/home/UI/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/home/UI/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          FeaturedBooksListView(),
          SizedBox(height: 36),
          Text("Best Seller", style: Styles.textStyle20),
          BestSellerListViewItem(),
        ],
      ),
    );
  }
}

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 100,
          child: AspectRatio(
            aspectRatio: 0.7,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(AssetsData.testImage)),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Book Name", style: Styles.textStyle18, maxLines: 2),
            Text("Writer Name", style: Styles.textStyle16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("19.99 ", style: Styles.textStyle20),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: const Color.fromARGB(255, 225, 193, 76),
                      size: 24,
                    ),
                    Text("4.8", style: Styles.textStyle16),
                    Text("(2280)", style: Styles.textStyle16),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:bookly_app/core/utilities/styles.dart';
import 'package:bookly_app/features/home/UI/views/widgets/best_seller_list_view_item.dart';
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
          const CustomAppBar(),
          const FeaturedBooksListView(),
          const SizedBox(height: 36),
          const Text("Best Seller", style: Styles.textStyle20),
          const BestSellerListViewItem(),
        ],
      ),
    );
  }
}

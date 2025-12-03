import 'package:bookly_app/core/utilities/assets.dart';
import 'package:flutter/material.dart';

class FeaturedListViewItem extends StatelessWidget {
  const FeaturedListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AspectRatio(
        aspectRatio: 0.7,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AssetsData.testImage)),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}

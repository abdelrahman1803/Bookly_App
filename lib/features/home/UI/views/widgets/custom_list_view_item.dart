import 'package:bookly_app/core/utilities/assets.dart';
import 'package:flutter/material.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: AspectRatio(
        aspectRatio: 0.7,
        child: Container(
          // width: 100,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AssetsData.testImage)),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}

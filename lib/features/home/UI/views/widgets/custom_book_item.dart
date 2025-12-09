import 'package:bookly_app/core/utilities/widgets/custom_error_image_widget.dart';
import 'package:bookly_app/core/utilities/widgets/custom_loading_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookItem extends StatelessWidget {
  const CustomBookItem({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
          aspectRatio: 0.7,
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: imageUrl,
            placeholder: (context, url) => CustomLoadingIndicator(),
            errorWidget: (context, url, error) => const ErrorImageWidget(),
          ),
        ),
      ),
    );
  }
}

import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utilities/widgets/custom_button.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    final price = book.saleInfo?.listPrice?.amount;
    return Padding(
      padding: kPaddingSH16,
      child: SizedBox(
        height: 40,
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                text: price != null ? '\$$price' : 'Free',
                textColor: Colors.black,
                backGroundColor: Colors.white,
                fontWeight: FontWeight.w900,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                onPressed: () async {
                  Uri url = Uri.parse(book.saleInfo!.buyLink!);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                },
              ),
            ),
            Expanded(
              child: CustomButton(
                text: "Free preview",
                textColor: Colors.white,
                backGroundColor: const Color(0xffEF8262),
                fontWeight: FontWeight.w900,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                onPressed: () async {
                  Uri url = Uri.parse(book.volumeInfo!.previewLink!);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

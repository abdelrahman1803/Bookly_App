import 'package:bookly_app/constats.dart';
import 'package:bookly_app/core/utilities/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPaddingSH16,
      child: SizedBox(
        height: 40,
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                text: "19.99 £",
                textColor: Colors.black,
                backGroundColor: Colors.white,
                fontWeight: FontWeight.w900,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                onPressed: () {},
              ),
            ),
            Expanded(
              child: CustomButton(
                text: "Free preview",
                textColor: Colors.white,
                backGroundColor: Color(0xffEF8262),
                fontWeight: FontWeight.w900,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

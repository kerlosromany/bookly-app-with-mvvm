import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/styles.dart';

class BookRate extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final num rating;
  final num count;
  const BookRate({super.key, this.mainAxisAlignment = MainAxisAlignment.start , required this.count , required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
        ),
        const SizedBox(width: 6.3),
         Text(
          "$rating",
          style: Styles.textStyle16,
        ),
        const SizedBox(width: 5),
        Text(
          "$count",
          style: Styles.textStyle14.copyWith(color: const Color(0xff707070)),
        ),
      ],
    );
  }
}

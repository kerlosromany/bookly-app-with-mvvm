// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:advanced_project/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import 'package:advanced_project/core/app_router.dart';
import 'package:advanced_project/features/home/data/models/book_model/book_model.dart';

import '../../../../../core/styles.dart';
import 'book_rating.dart';

class BookListViewItem extends StatelessWidget {
  final BookModel bookModel;
  const BookListViewItem({
    Key? key,
    required this.bookModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        GoRouter.of(context).push(AppRouter.bookDetailsView , extra: bookModel);
      },
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            CustomBookImage(
                imageUrl: (bookModel.volumeInfo?.imageLinks?.thumbnail) ??
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqi9SJoLFKvAI8bzBFi7QrMj-y7L-fgjlP9A&usqp=CAU'),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      bookModel.volumeInfo!.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(bookModel.volumeInfo!.authors![0],
                      style: Styles.textStyle14),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Text(
                        "Free",
                        style: Styles.textStyle20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      BookRate(count: (bookModel.volumeInfo?.ratingsCount) ?? 0 , rating: (bookModel.volumeInfo?.averageRating) ?? 0 ),
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

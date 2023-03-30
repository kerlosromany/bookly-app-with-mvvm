import 'package:advanced_project/features/home/data/models/book_model/book_model.dart';
import 'package:advanced_project/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/styles.dart';
import 'book_rating.dart';
import 'books_action.dart';

class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.2),
          child: CustomBookImage(
              imageUrl: bookModel.volumeInfo?.imageLinks?.thumbnail ??
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqi9SJoLFKvAI8bzBFi7QrMj-y7L-fgjlP9A&usqp=CAU'),
        ),
        const SizedBox(height: 40),
        Text(
          "${bookModel.volumeInfo!.title}",
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Opacity(
          opacity: 0.7,
          child: Text(
            bookModel.volumeInfo!.authors![0],
            style: Styles.textStyle18.copyWith(
                fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),
          ),
        ),
        const SizedBox(height: 18),
        BookRate(
          mainAxisAlignment: MainAxisAlignment.center,
          count: bookModel.volumeInfo?.ratingsCount ?? 0,
          rating: bookModel.volumeInfo?.averageRating ?? 0,
        ),
        const SizedBox(height: 37),
         BooksAction(bookModel: bookModel),
      ],
    );
  }
}

import 'package:advanced_project/core/styles.dart';
import 'package:advanced_project/core/widgets/custom_button.dart';
import 'package:advanced_project/features/home/data/models/book_model/book_model.dart';
import 'package:advanced_project/features/home/presentation/views/widgets/book_rating.dart';
import 'package:advanced_project/features/home/presentation/views/widgets/books_action.dart';
import 'package:advanced_project/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:advanced_project/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'books_details_section.dart';
import 'custom_book_details_appbar.dart';
import 'custom_book_image.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key , required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children:  [
                const CustomBookDetailsAppBar(),
                BooksDetailsSection(bookModel: bookModel),
                const Expanded(child: SizedBox(height: 50)),
                const SimilarBooksSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

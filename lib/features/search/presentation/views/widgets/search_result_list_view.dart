import 'package:advanced_project/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

import '../../../../home/presentation/views/widgets/best_seller_list_view_item.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: 20,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: BookListViewItem(bookModel: BookModel()), ///////////
        );
      },
    );
  }
}

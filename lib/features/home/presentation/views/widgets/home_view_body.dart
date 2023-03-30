import 'package:advanced_project/core/styles.dart';
import 'package:advanced_project/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:advanced_project/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'custom_app_bar.dart';
import 'custom_book_image.dart';
import 'featured_books_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CustomAppBar(),
                FeaturedBooksListView(),
                Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text(
                    "Best Seller",
                    style: Styles.textStyle18,
                  ),
                ),
                // BestSellerListView(),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            // shrink wrap : true
            child: BestSellerListView(),
          ),

          // const SliverFillRemaining(   // الويدجت دي خلتني استغني عن ال شرينك راب ب ترو لان كدا مش هحمل غير العناصر اللي ظاهرة فقط عكس ال 3 سطور اللي فوق دول
          //   child: BestSellerListView(),  // shrink wrap : false
          // ),
        ],
      ),
    );
  }
}

import 'package:advanced_project/core/widgets/custom_error_widget.dart';
import 'package:advanced_project/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/app_router.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import 'custom_book_image.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal, 
              itemCount: state.books.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.bookDetailsView , extra: state.books[index]);
                    },
                    child: CustomBookImage(
                        imageUrl: (state.books[index].volumeInfo?.imageLinks
                                ?.thumbnail) ??
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqi9SJoLFKvAI8bzBFi7QrMj-y7L-fgjlP9A&usqp=CAU'),
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}

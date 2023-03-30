import 'package:advanced_project/core/widgets/custom_error_widget.dart';
import 'package:advanced_project/core/widgets/custom_loading_indicator.dart';
import 'package:advanced_project/features/home/presentation/manager/similar%20books_cubit/similar_books_cubit.dart';
import 'package:advanced_project/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CustomBookImage(
                      imageUrl: state
                              .books[index].volumeInfo?.imageLinks?.thumbnail ??
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqi9SJoLFKvAI8bzBFi7QrMj-y7L-fgjlP9A&usqp=CAU'),
                );
              },
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}

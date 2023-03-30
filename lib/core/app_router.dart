import 'package:advanced_project/core/service_locator.dart';
import 'package:advanced_project/features/home/data/models/book_model/book_model.dart';
import 'package:advanced_project/features/home/data/repos/home_repo_impl.dart';
import 'package:advanced_project/features/home/presentation/manager/similar%20books_cubit/similar_books_cubit.dart';
import 'package:advanced_project/features/home/presentation/views/book_details_view.dart';
import 'package:advanced_project/features/home/presentation/views/home_view.dart';
import 'package:advanced_project/features/search/presentation/views/search_view.dart';
import 'package:advanced_project/features/splash/presentation/view/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: homeView,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: splashView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: bookDetailsView,
        builder: (context, state) =>  BlocProvider(
          create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
          child: BookDetailsView(bookModel: state.extra as BookModel),
        ),
      ),
      GoRoute(
        path: searchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );

  static const splashView = '/';
  static const homeView = '/homeView';
  static const bookDetailsView = '/bookDetailsView';
  static const searchView = '/searchView';
}

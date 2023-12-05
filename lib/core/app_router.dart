import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/Features/home/data/models/book_model/book_model.dart';
import 'package:quiz_app/Features/home/data/models/repo/home_repo_impl.dart';
import 'package:quiz_app/Features/home/data/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:quiz_app/Features/home/data/presentation/views/book_details_view.dart';
import 'package:quiz_app/Features/home/data/presentation/views/home_view.dart';
import 'package:quiz_app/core/utils/service_locator.dart';
import 'package:quiz_app/views/widgets/onboarding.dart';

import '../Features/search/presentation/views/search_view.dart';
import '../views/splash_view.dart';

abstract class AppRouter {
    static const mHomeView = '/homeView';
    static const mBookDetailsView = '/bookDetaisView';
    static const mSearchView = '/searchView';
    static const mOnBoardingBody = '/onBoardingBody';



  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: mOnBoardingBody,
        builder: (context, state) =>  OnBoardingBody(),
      ),

      GoRoute(
        path: mSearchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: mHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: mBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context)=>SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
            child:  BookDetailsView(
              bookModel: state.extra as BookModel,
            )),
      ),
    ],
  );
}

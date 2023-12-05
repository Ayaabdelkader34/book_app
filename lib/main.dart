import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/Features/home/data/models/repo/home_repo_impl.dart';
import 'package:quiz_app/Features/home/data/presentation/manager/newest_books_cubit/newset_books_cubit.dart';
import 'package:quiz_app/core/utils/service_locator.dart';

import 'Features/home/data/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'constants.dart';
import 'core/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>FeaturedBooksCubit(getIt.get<HomeRepoImpl>(),)..fetchFeaturedBooks()),
        BlocProvider(create: (context)=>NewsetBooksCubit(getIt.get<HomeRepoImpl>(),)..fetchNewestBooks()),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
       theme: ThemeData().copyWith(scaffoldBackgroundColor: mPrimaryColor,
       textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),),
      ),

    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/Features/home/data/presentation/manager/newest_books_cubit/newset_books_cubit.dart';
import 'package:quiz_app/core/widgets/custom_error_widget.dart';
import 'package:quiz_app/core/widgets/custom_loading_indicator.dart';

import 'best_seller_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit,NewsetBooksState>(
      builder: (context,state){
        if(state is NewsetBooksSuccess){

      return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: state.books.length,
        itemBuilder: (context, index) {
          return  Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: BookListViewItem(bookModel: state.books[index],),
          );
        },
      );}
        else if (state is  NewsetBooksFailure){
          return CustomErrorWidget(errMessage: state.errMessage);
        }
        else {
          return const CustomLoadingIndicator();
        }
      }

    );
  }
}

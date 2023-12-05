import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Features/home/data/models/book_model/book_model.dart';
import '../utils/function/lunch_url.dart';
import 'custom_button.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});
 final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children:   [
          const Expanded(
            child: CustomButton(
              text: '19.99 €',
              backgroundColor:Colors.white ,
              textColor: Colors.black,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
              ),
            ),
          ),
           Expanded(
            child: CustomButton(
              onPressed: (){
                launchCustomUr(context,bookModel.volumeInfo.previewLink);
              },
              text: getText(bookModel),
              backgroundColor:const Color.fromARGB(255, 213, 184, 231) ,
              textColor: Colors.white,
              borderRadius: const BorderRadius.only(topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }

 String getText(BookModel bookModel) {
    if(bookModel.volumeInfo.previewLink==null){
      return 'Not Available !';
    }else{
      return 'Preview';
    }
  }
}

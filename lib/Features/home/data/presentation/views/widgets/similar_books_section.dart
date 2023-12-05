import 'package:flutter/material.dart';
import 'package:quiz_app/Features/home/data/presentation/views/widgets/similar_list_view.dart';

import '../../../../../../core/utils/styles.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column (
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
        ),
          const SizedBox(
            height: 16,
          ),
          const SimilarBooksListview(),
      ],
    );
  }
}
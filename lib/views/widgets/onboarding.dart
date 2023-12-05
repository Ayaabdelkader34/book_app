import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';
import 'package:quiz_app/Features/home/data/presentation/views/home_view.dart';

class OnBoardingBody extends StatelessWidget {
  final List<Introduction> list = [

    Introduction(
      title: 'Read',
      subTitle: 'Search for a book in any field and read it with all of exciting ',
      imageUrl: 'images/1.png',

    ),
    Introduction(
      title: 'Enjoy',
      subTitle: 'You will recommend a various books to your friends based om your preferences',
      imageUrl: 'images/2.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      backgroudColor: const Color.fromARGB(255, 213, 184, 231),
      foregroundColor: const Color.fromARGB(255, 89, 72, 127),
      introductionList: list,
      onTapSkipButton: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeView(),
          )),
      skipTextStyle: const TextStyle(
        color: Color.fromARGB(255, 89, 72, 127),
        fontSize: 18,
      ),
    );
  }}
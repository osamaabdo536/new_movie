import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../home_screen.dart';
import '../my_theme.dart';
import 'on_boarding_page.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = 'ongoing';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController controller = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: controller,
          onPageChanged: (index) {
            onLastPage = (index == 2);
            setState(() {});
          },
          children: [
            OnBoardingPage(
              imgPath: 'assets/images/movie.jpg',
              description:
                  "Explore the latest releases and top-rated movies with our intuitive carousel sliders. Stay ahead of the curve and discover what's coming soon!",
            ),
            OnBoardingPage(
              imgPath: 'assets/images/search2.jpg',
              description:
              "Looking for something specific? Our powerful search feature lets you find any movie effortlessly. Dive into a vast ocean of cinema with just a few taps."            ),
            OnBoardingPage(
              imgPath: 'assets/images/category1.jpg',
              description:
              "Browse through a variety of genres and explore curated lists of movies in each category. Whether it's action, romance, or comedy, we have something for every mood."            ),
          ],
        ),
        Container(
          alignment: Alignment(0, 0.85),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  controller.jumpToPage(2);
                },
                child: Text('skip',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: MyTheme.whiteColor)),
              ),
              SmoothPageIndicator(controller: controller, count: 3),
              onLastPage
                  ? GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(HomeScreen.routeName);
                      },
                      child: Text('Done',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: MyTheme.whiteColor)),
                    )
                  : GestureDetector(
                      onTap: () {
                        controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                      child: Text('Next',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: MyTheme.whiteColor)),
                    ),
            ],
          ),
        ),
      ],
    );
  }
}

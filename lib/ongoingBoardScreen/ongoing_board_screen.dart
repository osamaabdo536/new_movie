import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie/home_screen.dart';
import 'package:movie/my_theme.dart';
import 'package:movie/ongoingBoardScreen/ongoing_page1.dart';
import 'package:movie/ongoingBoardScreen/ongoing_page2.dart';
import 'package:movie/ongoingBoardScreen/ongoing_page3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnGoingBoardScreen extends StatefulWidget {
  static const String routeName = 'ongoing';

  @override
  State<OnGoingBoardScreen> createState() => _OnGoingBoardScreenState();
}

class _OnGoingBoardScreenState extends State<OnGoingBoardScreen> {
  PageController controller = PageController();

  bool onLastPage = false ;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: controller,
          onPageChanged: (index){
            onLastPage = (index == 2);
            setState(() {

            });
          },
          children: [
            OnGoingPage1(),
            OnGoingPage2(),
            OnGoingPage3(),
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
                        .copyWith(color: MyTheme.blackColor)),
              ),
              SmoothPageIndicator(controller: controller, count: 3),
              onLastPage ?
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(HomeScreen.routeName);
                },
                child: Text('Done',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: MyTheme.blackColor)),
              ): GestureDetector(
                onTap: () {
                  controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                child: Text('Next',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: MyTheme.blackColor)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

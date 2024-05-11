import 'package:flutter/material.dart';

import '../my_theme.dart';

class OnBoardingPage extends StatelessWidget {
  String description;
  String imgPath ;
  OnBoardingPage({required this.imgPath,required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.blackColor,
      body: Column(
        children: [
          Image.asset(imgPath,
          width: double.infinity,
          height: MediaQuery.of(context).size.height*0.7,
          ),
          Text(description,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: MyTheme.whiteColor
          ),)
        ],
      ),
    );
  }
}

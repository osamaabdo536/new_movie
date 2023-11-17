import 'package:flutter/material.dart';
import '../../../model/categoryDM.dart';
import '../../../my_theme.dart';

class CategoryItem extends StatelessWidget {
  CategoryDM categoryDetails;
  int index;
  CategoryItem(
      {required this.categoryDetails,
      required this.index,
      required CategoryDM});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(categoryDetails.image),
        Text(
          categoryDetails.title,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: MyTheme.whiteColor,
          ),
        ),
      ],
    );
  }
}

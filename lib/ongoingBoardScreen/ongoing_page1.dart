import 'package:flutter/material.dart';

import '../my_theme.dart';

class OnGoingPage1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink[100],
      child: Center(child: Text('Page 1',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: MyTheme.blackColor
          ))),
    );
  }
}

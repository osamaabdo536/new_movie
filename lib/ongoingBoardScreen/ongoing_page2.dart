import 'package:flutter/material.dart';

import '../my_theme.dart';

class OnGoingPage2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple[100],
      child: Center(child: Text('Page 2',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: MyTheme.blackColor
          ))),
    );
  }
}

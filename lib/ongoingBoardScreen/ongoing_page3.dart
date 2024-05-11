import 'package:flutter/material.dart';

import '../my_theme.dart';

class OnGoingPage3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[100],
      child: Center(child: Text('page 3',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: MyTheme.blackColor
          ))),
    );
  }
}

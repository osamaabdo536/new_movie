import 'package:flutter/material.dart';
import 'my_theme.dart';

class CustomButtonAdd extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
return Stack(

  children: [

    Image.asset('assets/images/add_icon.png'),

    Icon(Icons.add,color: MyTheme.whiteColor,),

  ],

);
  }



}
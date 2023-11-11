import 'package:flutter/material.dart';
import 'package:movie/my_theme.dart';
import 'package:movie/search/search_delegate.dart';


class SearchTab extends StatelessWidget {
  static const String routeName = 'SearchTab';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.primaryLightColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: InkWell(
                  child:const Icon(Icons.search,color: Colors.yellow,size: 100,),
                    onTap: ()=>showSearch(context: context, delegate:MoviesSearchDelegate()),
                  ),
                ),
          ),
          // Image.asset('images/Group 22.png'),
        ],
      ),
    );
  }
}

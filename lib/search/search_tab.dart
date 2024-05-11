import 'package:flutter/material.dart';
import 'package:movie/search/search_delegate.dart';

import '../my_theme.dart';


class SearchTab extends StatelessWidget {
  static const String routeName = 'SearchTest';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme.primaryLightColor,
        body: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Padding(
                  padding: const EdgeInsets.all(30),
                  child:ElevatedButton(
                      onPressed: () => showSearch(
                          context: context, delegate: MoviesSearchDelegate()),
                      style: ElevatedButton.styleFrom(backgroundColor: MyTheme.gryColor,
                        side: const BorderSide(color: Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child:const Row(
                        children: [
                          Icon(Icons.search),
                          SizedBox(width:15,),
                          Text('Search',style:TextStyle(color: Colors.grey),),
                        ],
                      ))
              ),
              const SizedBox(height:200),
              Container(
                  color: MyTheme.primaryLightColor,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children:[
                        Icon(Icons.movie,color:MyTheme.gryColor,size:100,),
                        const SizedBox(height: 20,),
                        Center(
                          child: Text('Not Movies Founded',style:Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: MyTheme.gryColor
                          ),
                          ),
                        ),
                      ],
                  )
              )
            ])
    );
  }

}
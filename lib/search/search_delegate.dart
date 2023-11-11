import 'package:flutter/material.dart';
import 'package:movie/api/api_manager.dart';
import 'package:movie/my_theme.dart';

import '../home/cupit/movies_view_model.dart';
import '../model/PopularResponse.dart';

class MoviesSearchDelegate extends SearchDelegate {
  MoviesViewModel viewModel = MoviesViewModel();
  int selectedIndex = 0;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(icon:const Icon(Icons.search,size: 40,color:Colors.yellow), onPressed: ()=>showResults(context),),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return       IconButton(icon:const Icon(Icons.close,size: 40,color:Colors.yellow,),
      onPressed: ()=>Navigator.of(context).pop(),)
    ;
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return FutureBuilder<dynamic>(
        future: APIManager.getPopular(),
        builder:(context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if (snapshot.hasError){
            return Column(
              children: [
                const Text('Something went wrong'),
                Center(
                  child: ElevatedButton(onPressed:()
                  {
                    APIManager.getSearch(query);
                   }, child: const Text('try again')),
                ),
              ],
            );
          }if(snapshot.data?.success == false){
            return Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                Text(snapshot.data!.statusMessage??''),
                Center(
                  child: ElevatedButton(onPressed:()
                  {
                    APIManager.getSearch(query);
                   }, child: const Text('try again')),
                ),
              ],
            );
          }
          var popularList = snapshot.data?.results??[];
          return ListView.builder(
            itemBuilder:(context,index){
              return Container(
                color: Colors.yellow,
                child: Row(
                  children: [
                    Text(popularList[index].title??'',style:const TextStyle(color: Colors.black),),
                ],
                )) ;
            },
            itemCount: popularList.length,
          );
        },
      );
    }
    else {
      return Container();
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }

  @override
  ThemeData appBarTheme(BuildContext context) {

    return ThemeData(
      primaryColor: MyTheme.yellowColor,
      inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
              borderSide: BorderSide.none
          )
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: MyTheme.primaryLightColor,
      ),
    );
  }

}
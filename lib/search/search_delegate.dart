import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../api/api_constants.dart';
import '../api/api_manager.dart';
import '../details/popular_details.dart';
import '../model/TopRatedResponse.dart';
import '../my_theme.dart';
///int selectedIndex = 0;

class MoviesSearchDelegate extends SearchDelegate {
  // MoviesViewModel viewModel = MoviesViewModel();
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.search, size: 40, color: Color(0xFFFFB224)),
        onPressed: () => showResults(context),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.close,
        size: 40,
        color: Color(0xFFFFB224),
      ),
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isNotEmpty) {
      return Scaffold(
        backgroundColor: MyTheme.primaryLightColor,
        body: FutureBuilder<TopRatedResponse>(
          future: APIManager.getSearch(query),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                color: MyTheme.primaryLightColor,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFFFFB224),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Column(
                children: [
                  const Text('Something went wrong'),
                  Container(
                    color: MyTheme.primaryLightColor,
                    child: Center(
                      child: ElevatedButton(
                          onPressed: () {
                            APIManager.getSearch(query);
                          },
                          child: const Text('try again')),
                    ),
                  ),
                ],
              );
            }
            if (snapshot.data?.success == false) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(snapshot.data!.statusMessage ?? ''),
                  Container(
                    color: MyTheme.primaryLightColor,
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          APIManager.getSearch(query);
                        },
                        child: const Text('try again'),
                      ),
                    ),
                  ),
                ],
              );
            }
            var popularList = snapshot.data?.results ?? [];
            return ListView.builder(
              itemBuilder: (context, index) {

                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                        PopularDetailsScreen.routeName,
                        arguments: popularList[index]);
                  },
                  child: Container(
                      color: MyTheme.primaryLightColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.network(
                              '${APIConstants.imageUrl}${popularList[index].posterPath}',
                              fit: BoxFit.fill,
                              scale: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(7),
                              child: Column(
                                children: [
                                  Text(popularList[index].originalTitle ?? '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(color: MyTheme.whiteColor)),
                                  Text(popularList[index].releaseDate ?? '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(color: MyTheme.gryColor)),
                                  Row(
                                    children: [
                                      Text(
                                        "${double.parse(popularList[index].voteAverage!.toString())}",
                                        style: TextStyle(color: MyTheme.gryColor),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: MyTheme.yellowColor,
                                        size: 24.sp,
                                      ),
                                    ],
                                  ),
                                  Text(
                                      'Language : ${popularList[index].originalLanguage.toString()}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(color: MyTheme.gryColor)),
                                  Text(
                                      'Popularity : ${popularList[index].popularity.toString()}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(color: MyTheme.gryColor)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                );
              },
              itemCount: popularList.length,
            );
          },
        ),
      );
    } else {
      return Container(
          color: MyTheme.primaryLightColor,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:[
                Icon(Icons.movie,color:MyTheme.gryColor,size:100,),
                SizedBox(height: 20,),
                Center(
                  child: Text('Not Movies Founded',style:Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: MyTheme.gryColor
                  ),
                  ),
                ),
              ]
          )
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      hintColor:MyTheme.gryColor ,
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: Colors.yellow,
          fontSize: 18.0,
        ),),
      primaryColor: Color(0xFFFFB224),
      inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(borderSide: BorderSide.none)),
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: MyTheme.primaryLightColor,
      ),
    );
  }
}
///inputDecorationTheme: const InputDecorationTheme(
///border: OutlineInputBorder(borderSide: BorderSide.none)),
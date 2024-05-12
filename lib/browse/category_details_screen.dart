import 'package:flutter/material.dart';
import '../api/api_manager.dart';
import '../details/popular_details.dart';
import '../model/PopularResponse.dart';
import '../model/categoryDM.dart';
import '../my_theme.dart';
import 'category/movies_item.dart';

class CategoryDetails extends StatefulWidget {
  static const String routName = 'category-details';

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    var category = ModalRoute.of(context)?.settings.arguments as CategoryDM;
    return Scaffold(
      backgroundColor: MyTheme.blackColor,
      appBar: AppBar(
        backgroundColor: MyTheme.blackColor,
        centerTitle: true,
        title: Text(
          category.title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: MyTheme.yellowColor,
          ),
        ),
      ),
      body: FutureBuilder<PopularResponse>(
          future: APIManager.getMoviesByGenreId(category.id.toString()),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                color: MyTheme.whiteColor,
              ));
            }
            else if (snapshot.hasError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Something went wrong",
                    style: TextStyle(
                      color: MyTheme.whiteColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.black)),
                        onPressed: () {
                          APIManager.getPopular();
                        },
                        child: const Text("Try Again")),
                  ),
                ],
              );
            }
            if (snapshot.data?.success != false) {
              Column(
                children: [
                  Text(snapshot.data?.statusMessage ?? ''),
                  ElevatedButton(
                      onPressed: () {
                        APIManager.getMoviesByGenreId(category.id.toString());
                      },
                      child: const Text("Try Again")),
                ],
              );
            }
            var sourceList = snapshot.data?.results ?? [];
            return ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                          PopularDetailsScreen.routeName,
                          arguments:snapshot.data!.results![index] );
                    },
                    child: ItemMovies(
                      movies: snapshot.data!.results![index],
                    ),
                  ),
                );
              },
              itemCount: sourceList.length,
            );
          }),
    );
  }
}

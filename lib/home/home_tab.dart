import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/home/popular_movie_carousel_slider.dart';
import 'package:movie/home/recommended_list.dart';
import 'package:movie/home/up_coming_list.dart';

import '../my_theme.dart';
import 'cupit/movies_view_model.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  MoviesViewModel viewModel = MoviesViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.blackColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            PopularMoviesCarouselSlider(),
            SizedBox(
              height: 20.h,
            ),
            UpComingList(),
            SizedBox(
              height: 18.h,
            ),
            RecommendedList(),
          ],
        ),
      ),
    );

    // ChangeNotifierProvider(
    //   create: (context) => viewModel,
    //   child: Consumer<HomeTabViewModel>(builder: (context, viewModel, child) {
    //     if (viewModel.moviesList == null) {
    //       return Center(
    //         child: CircularProgressIndicator(
    //           color: MyTheme.yellowColor,
    //         ),
    //       );
    //     } else {
    //       return CircularProgressIndicator(
    //         color: Colors.blue,
    //       );
    //     }
    //   }),
    // );

    Scaffold(
      backgroundColor: MyTheme.blackColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 220,
            width: double.infinity,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(6),
                    child: ClipRRect(
                      child: Container(
                        color: Colors.orange,
                        height: 200,
                        width: 300,
                      ),
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'New Releases',
                style: TextStyle(
                  color: MyTheme.whiteColor,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          SizedBox(
            height: 150,
            width: double.infinity,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: ClipRRect(
                      child: Container(
                        color: Colors.orange,
                        height: 200,
                        width: 90,
                      ),
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Recomended',
                style: TextStyle(
                  color: MyTheme.whiteColor,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 170,
            width: double.infinity,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: ClipRRect(
                      child: Container(
                        color: Colors.orange,
                        height: 200,
                        width: 90,
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

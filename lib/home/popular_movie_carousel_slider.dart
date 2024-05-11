import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/details/popular_details.dart';
import 'package:movie/my_theme.dart';
import '../api/api_constants.dart';
import '../model/MoviesDetails.dart';
import 'cupit/movies_states.dart';
import 'cupit/movies_view_model.dart';

class PopularMoviesCarouselSlider extends StatefulWidget {

  @override
  State<PopularMoviesCarouselSlider> createState() => _PopularMoviesCarouselSliderState();
}

class _PopularMoviesCarouselSliderState extends State<PopularMoviesCarouselSlider> {
  MoviesViewModel viewModel = MoviesViewModel();
  int selectedIndex = 0;
  MoviesDetails? popular;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        BlocBuilder<MoviesViewModel, MoviesStates>(
          bloc: viewModel,
          builder: (context, state) {
            if (state is MoviesSuccessState) {
              return CarouselSlider.builder(
                itemCount: state.moviesList.length,
                itemBuilder: (context, index, realIndex) {
                  selectedIndex = index ;
                  return InkWell(
                    onTap: () {Navigator.of(context).pushNamed(PopularDetailsScreen.routeName,
                        arguments:state.moviesList[index]

                    );},
                    child: Stack(
                      children: [
                        Image.network(
                          '${APIConstants.imageUrl}${state.moviesList[index].posterPath}',
                          fit: BoxFit.fill,
                          width: double.infinity,
                        ),
                        Stack(
                          children: [
                            Center(
                              child: ImageIcon(
                                const AssetImage('assets/images/play_button.png',),
                                color: MyTheme.whiteColor,
                                size: 100,
                              ),
                            ),
                            Positioned(
                              bottom: -0.h,
                              right: 140.h,
                              child: SizedBox(
                                height: 150,
                                width: 250,
                                child: Stack(
                                  children: [
                                    Hero(
                                      tag: 'img-${state.moviesList[index].id}',
                                      child: Image.network("${APIConstants.imageUrl}${state.moviesList[index].posterPath}" ,
                                        fit: BoxFit.fill,
                                        height: double.infinity,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  pageSnapping: true,
                  padEnds: false,
                  viewportFraction: 1,
                  clipBehavior: Clip.none,
                  height: 210.h,
                  enableInfiniteScroll: true,
                  autoPlay: true ,
                  autoPlayInterval: const Duration(seconds: 3),
                  scrollDirection: Axis.horizontal,
                ),
              );
            } else if (state is MoviesErrorState) {
              return Center(
                child: Column(
                  children: [
                    Text(
                      state.errorMessage!,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          viewModel.getPopularMovies();
                          setState(() {});
                        },
                        child: Text(
                          'Try again!!',
                          style: Theme.of(context).textTheme.titleSmall,
                        )),
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              );
            }
          },
        )
      ],
    );
  }
}

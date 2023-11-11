import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/addToWatchlistButton.dart';
import '../api/api_constants.dart';
import '../details/popular_details.dart';
import '../model/MoviesDetails.dart';
import '../my_theme.dart';
import 'cupit/movies_states.dart';
import 'cupit/movies_view_model.dart';

class RecommendedList extends StatefulWidget {
  @override
  State<RecommendedList> createState() => _RecommendedListState();
}

class _RecommendedListState extends State<RecommendedList> {
  MoviesViewModel viewModel = MoviesViewModel();
  MoviesDetails? topRated;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {

     return BlocBuilder<MoviesViewModel,MoviesStates>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is MoviesSuccessState) {
          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Recommended",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: MyTheme.whiteColor
                      )
                  ),
                ],
              ),
              Container(
                color: MyTheme.darkGry,
                height: 300,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.moviesList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          height: 200,
                          width: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Stack(
                                children: [
                                  InkWell(
                                    onTap:(){Navigator.of(context).pushNamed(PopularDetailsScreen.routeName,
                                        arguments:state.moviesList[index]
                                    );},
                                    child: Image.network("${APIConstants.imageUrl}${state.moviesList[index].posterPath}" ,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  CustomButtonAdd()
                                  // Image.asset('assets/images/add_icon.png'),
                                  // Icon(Icons.add,color: MyTheme.whiteColor,),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: MyTheme.yellowColor,
                                    size: 24.sp,
                                  ),
                                  SizedBox(
                                    width: 5.h,
                                  ),
                                  Text("${double.parse(state.moviesList[index].voteAverage!.toString())}",style: TextStyle(
                                    color: MyTheme.whiteColor
                                  ),),
                                ],
                              ),
                              Text(state.moviesList[index].title! ,
                                style: TextStyle(
                                  color: MyTheme.whiteColor,
                                fontSize: 16
                              ),
                                maxLines: 1,
                              ),
                              Text(state.moviesList[index].releaseDate!,style: TextStyle(
                                  color: MyTheme.whiteColor
                              ),),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          );
        } else if (state is MoviesErrorState) {
          return Center(
            child: Column(
              children: [
                Text(
                  state.errorMessage,///!
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
    );




  }
}

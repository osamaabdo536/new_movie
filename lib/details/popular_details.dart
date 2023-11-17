import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/addToWatchlistButton.dart';
import 'package:movie/details/cubit/popular_details_states.dart';
import 'package:movie/details/cubit/popular_details_view_model.dart';
import 'package:movie/my_theme.dart';
import 'package:readmore/readmore.dart';
import '../api/api_constants.dart';
import '../firebase_Utils/firebase_utis.dart';
import '../firebase_Utils/movieDm.dart';
import '../model/MoviesDetails.dart';

class PopularDetailsScreen extends StatefulWidget {
  static const String routeName = 'Details';

  @override
  State<PopularDetailsScreen> createState() => _PopularDetailsScreenState();
}

class _PopularDetailsScreenState extends State<PopularDetailsScreen> {
  PopularDetailsViewModel viewModel = PopularDetailsViewModel();

  ///MoviesDetails? popular;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as MoviesDetails;

    return Scaffold(
      appBar: AppBar(
          actionsIconTheme: IconThemeData(color: MyTheme.yellowColor),
          title: Text(
            args.title!,
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: MyTheme.yellowColor),
          ),
          backgroundColor: MyTheme.primaryLightColor,
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)))),
      backgroundColor: MyTheme.primaryLightColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Image.network(
                    '${APIConstants.imageUrl}${args.posterPath}',
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  Center(
                    child: ImageIcon(
                      const AssetImage(
                        'assets/images/play_button.png',
                      ),
                      color: MyTheme.whiteColor,
                      size: 100,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                children: [

                  Row(
                    children: [
                      Text(
                        args.title!,
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Text(
                        args.releaseDate!,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: MyTheme.gryColor, fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: Row(
                      children: [
                        Stack(children: [
                          Image.network("${APIConstants.imageUrl}${args.posterPath}"),
                          InkWell(
                            onTap: () {
                              MovieDM movieDM = MovieDM(
                                  title: args.title,
                                  posterPath: args.posterPath,
                                  voteAverage: args.voteAverage,
                                  releaseDate: args.releaseDate,
                                  overview: args.overview,
                                  id: args.id,
                                  isWatchList: true);
                              FirebaseUtils.addMovieToFirebase(movieDM);

                              print('movie Added successfully');
                            },
                            child: CustomButtonAdd(),
                          ),
                        ]),

                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: MyTheme.yellowColor,
                                        size: 24.sp,
                                      ),
                                      Text(
                                        '${args.voteAverage}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(
                                                color: MyTheme.yellowColor, fontSize: 14),
                                      ),
                                    ],
                                  ),

                                  ReadMoreText(
                                    args.overview??'yfuj',
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: 'Show more',
                                    trimExpandedText: 'Show less',
                                    trimLines: 10,

                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(color: MyTheme.whiteColor, fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                ],
              ),
            ),
            BlocBuilder<PopularDetailsViewModel, PopularDetailsStates>(
              bloc: viewModel..getSimilarMovies(args.id!),
              builder: (context, state) {
                if (state is PopularDetailsLoadingState) {
                  const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  );
                } else if (state is PopularDetailsSuccessState) {
                  return Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("More like this",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: MyTheme.whiteColor)),
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
                                padding: const EdgeInsets.all(12),
                                child: Container(
                                  height: 200,
                                  width: 120,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.stretch,
                                    children: [
                                      Stack(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.of(context).pushNamed(
                                                  PopularDetailsScreen
                                                      .routeName,
                                                  arguments:
                                                  state.moviesList[index]);
                                            },
                                            child: Image.network(
                                              "${APIConstants.imageUrl}${state.moviesList[index].posterPath}",
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              MovieDM movieDM = MovieDM(
                                                  title: state
                                                      .moviesList[index].title,
                                                  posterPath: state
                                                      .moviesList[index]
                                                      .posterPath,
                                                  voteAverage: state
                                                      .moviesList[index]
                                                      .voteAverage,
                                                  releaseDate: state
                                                      .moviesList[index]
                                                      .releaseDate);
                                              FirebaseUtils.addMovieToFirebase(
                                                  movieDM);

                                              print('movie Added successfully');
                                            },
                                            child: CustomButtonAdd(),
                                          ),
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
                                          Text(
                                            "${double.parse(state.moviesList[index].voteAverage!.toString())}",
                                            style: TextStyle(
                                                color: MyTheme.whiteColor),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        state.moviesList[index].title!,
                                        style: TextStyle(
                                            color: MyTheme.whiteColor,
                                            fontSize: 16),
                                        maxLines: 1,
                                      ),
                                      Text(
                                        state.moviesList[index].releaseDate!,
                                        style: TextStyle(
                                            color: MyTheme.whiteColor),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  );
                } else if (state is PopularDetailsErrorState) {
                  return Center(
                    child: Column(
                      children: [
                        Text(
                          state.errorMessage!,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              viewModel.getSimilarMovies(args.id!);
                              setState(() {});
                            },
                            child: Text(
                              'Try again!!',
                              style: Theme.of(context).textTheme.titleSmall,
                            )),
                      ],
                    ),
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}

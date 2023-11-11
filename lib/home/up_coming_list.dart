import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/api/api_constants.dart';

import '../details/popular_details.dart';
import '../my_theme.dart';
import 'cupit/movies_states.dart';
import 'cupit/movies_view_model.dart';

class UpComingList extends StatefulWidget {
  @override
  State<UpComingList> createState() => _UpComingListState();
}

class _UpComingListState extends State<UpComingList> {
  MoviesViewModel viewModel = MoviesViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getUpComingMovies();
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
                      "New Released",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: MyTheme.whiteColor
                      )
                  ),
                ],
              ),
              Container(
                color: MyTheme.darkGry,
                height: 200,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.moviesList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          color: Colors.orange,
                          height: 200,
                          width: 120,
                          child: Stack(
                            children: [
                              InkWell(
                                onTap:(){Navigator.of(context).pushNamed(PopularDetailsScreen.routeName,
                        arguments:state.moviesList[index]
                        );},
                                child: Image.network("${APIConstants.imageUrl}${state.moviesList[index].posterPath}" ,
                                  fit: BoxFit.fill,
                                  height: double.infinity,
                                ),
                              ),
                              Image.asset('assets/images/add_icon.png'),
                              Icon(Icons.add,color: MyTheme.whiteColor,),
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
                  state.errorMessage,
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

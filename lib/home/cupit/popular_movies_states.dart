import '../../model/MoviesDetails.dart';

abstract class PopularMoviesStates{}

class PopularMoviesLoadingState extends PopularMoviesStates {}

class PopularMoviesSuccessState extends PopularMoviesStates {
   List<MoviesDetails> moviesList;
  PopularMoviesSuccessState({required this.moviesList});
}

final class PopularMoviesErrorState extends PopularMoviesStates {
  String errorMessage;
  PopularMoviesErrorState({required this.errorMessage});
}
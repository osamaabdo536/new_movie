
import '../../model/MoviesDetails.dart';

abstract class MoviesStates{}

class MoviesLoadingState extends MoviesStates {}

class MoviesSuccessState extends MoviesStates {
   List<MoviesDetails> moviesList;
  MoviesSuccessState({required this.moviesList});
}

final class MoviesErrorState extends MoviesStates {
  String errorMessage;
  MoviesErrorState({required this.errorMessage});
}
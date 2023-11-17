import '../../model/MoviesDetails.dart';

abstract class PopularDetailsStates{}

class PopularDetailsLoadingState extends PopularDetailsStates {}

class PopularDetailsSuccessState extends PopularDetailsStates {
  List<MoviesDetails> moviesList;
  PopularDetailsSuccessState({required this.moviesList});
}

class PopularDetailsErrorState extends PopularDetailsStates {
  String errorMessage;
  PopularDetailsErrorState({required this.errorMessage});
}
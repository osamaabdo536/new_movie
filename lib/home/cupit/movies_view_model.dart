

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/api/api_manager.dart';

import 'movies_states.dart';

class MoviesViewModel extends Cubit<MoviesStates>{
  MoviesViewModel():super(MoviesLoadingState());

  Future<void> getPopularMovies() async {
    emit(MoviesLoadingState());
    try{
      var response = await APIManager.getPopular();
      if(response.success == false){
        emit(MoviesErrorState(errorMessage: response.statusMessage!));
      }else{
        emit(MoviesSuccessState(moviesList: response.results ?? []));
      }
    }catch(e){
      emit(MoviesErrorState(errorMessage: e.toString()));
    }

  }

  Future<void> getTopRatedMovies() async {
    emit(MoviesLoadingState());
    try{
      var response = await APIManager.getTopRated();
      if(response.success == false){
        emit(MoviesErrorState(errorMessage: response.statusMessage!));
      }else{
        emit(MoviesSuccessState(moviesList: response.results ?? []));
      }
    }catch(e){
      emit(MoviesErrorState(errorMessage: e.toString()));
    }

  }

  Future<void> getUpComingMovies() async {
    emit(MoviesLoadingState());
    try{
      var response = await APIManager.getUpComing();
      if(response.success == false){
        emit(MoviesErrorState(errorMessage: response.statusMessage!));
      }else{
        emit(MoviesSuccessState(moviesList: response.results ?? []));
      }
    }catch(e){
      emit(MoviesErrorState(errorMessage: e.toString()));
    }
  }
}
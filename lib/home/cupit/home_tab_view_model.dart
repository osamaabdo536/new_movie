import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_movie/home/cupit/popular_movies_states.dart';
import '../../api/api_manager.dart';

class HomeTabViewModel extends Cubit<PopularMoviesStates>{
  HomeTabViewModel():super(PopularMoviesLoadingState());

  Future<void> getPopular() async {
    emit(PopularMoviesLoadingState());
    try{
      var response = await APIManager.getPopular();
      if(response.success == false){
        emit(PopularMoviesErrorState(errorMessage: response.statusMessage!));
      }else{
        emit(PopularMoviesSuccessState(moviesList: response.results ?? []));
      }
    }catch(e){
      emit(PopularMoviesErrorState(errorMessage: e.toString()));
    }

  }
}
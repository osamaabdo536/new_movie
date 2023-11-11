import 'package:movie/model/MoviesDetails.dart';

class MovieDM extends MoviesDetails{
  static const String collectionName = "movie";
String? Iid;
  MovieDM({this.Iid,super.title,super.posterPath,super.voteAverage,super.releaseDate});

MovieDM.fromFireStore(Map<String,dynamic> data):this(
  Iid: data['id'],
  title:data['title']  ,
posterPath: data['posterPath'],
  voteAverage: data['voteAverage'],
  releaseDate:data['releaseDate']
);

  Map<String, dynamic> toFireStore() {
    return {
      'id': Iid,
      'title': title,
      'posterPath': posterPath,
      'voteAverage': voteAverage,
      'releaseDate': releaseDate,
    };
  }

}
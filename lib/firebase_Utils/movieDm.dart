import 'package:movie/model/MoviesDetails.dart';

class MovieDM extends MoviesDetails {
  static const String collectionName = "movie";
  bool? isWatchList;
  MovieDM(
      {super.title,
      super.posterPath,
      super.voteAverage,
      super.releaseDate,
      super.overview,
      super.id,
      this.isWatchList = false});

  MovieDM.fromFireStore(Map<String, dynamic> data)
      : this(
            title: data['title'],
            posterPath: data['posterPath'],
            voteAverage: data['voteAverage'],
            releaseDate: data['releaseDate'],
            overview: data['overview'],
            id: data['id'],
            isWatchList: data['isWatchList']);

  Map<String, dynamic> toFireStore() {
    return {
      'title': title,
      'posterPath': posterPath,
      'voteAverage': voteAverage,
      'releaseDate': releaseDate,
      'overview': overview,
      'id': id,
      'isWatchList': isWatchList
    };
  }
}

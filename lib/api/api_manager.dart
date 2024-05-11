import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/PopularResponse.dart';
import '../model/SimilarResponse.dart';
import '../model/TopRatedResponse.dart';
import '../model/UpComingResponse.dart';
import 'api_constants.dart';

class APIManager {
  /// 'apiKey' : '6e551ef68f8c91f5a7acddf17ff38345'
  static Future<PopularResponse> getPopular() async {
    Uri url = Uri.https(APIConstants.baseUrl, APIConstants.popularApi, {
      "api_key": APIConstants.apiKey,
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return PopularResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<TopRatedResponse> getTopRated() async {
    Uri url = Uri.https(APIConstants.baseUrl, APIConstants.topRatedApi, {
      "api_key": APIConstants.apiKey,
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return TopRatedResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<UpComingResponse> getUpComing() async {
    Uri url = Uri.https(APIConstants.baseUrl, APIConstants.upComingApi, {
      "api_key": APIConstants.apiKey,
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return UpComingResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<SimilarResponse> getSimilar(int movieId) async {
    Uri url = Uri.parse(
        "https://${APIConstants.baseUrl}${APIConstants.movieApi}/${movieId}/similar?api_key=${APIConstants.apiKey}");
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return SimilarResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<TopRatedResponse> getSearch(String query) async {
    Uri url = Uri.https(APIConstants.baseUrl, APIConstants.searchApi, {
      "api_key": APIConstants.apiKey,
      "query": query,
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return TopRatedResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<PopularResponse> getMoviesByGenreId(String genreId) async {
    try {
      Uri url = Uri.https(APIConstants.baseUrl, APIConstants.movieEndPoint, {
        "api_key": APIConstants.apiKey,
        "with_genres": genreId,
      });
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      print(json);
      return PopularResponse.fromJson(json);
    } catch (e) {
      print(e);
      throw e;
    }
  }
}

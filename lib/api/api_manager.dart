import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie/model/TopRatedResponse.dart';
import 'package:movie/model/UpComingResponse.dart';

import '../model/PopularResponse.dart';
import 'api_constants.dart';

class APIManager {
    /// 'apiKey' : '6e551ef68f8c91f5a7acddf17ff38345'
  static Future<PopularResponse> getPopular() async {
    Uri url = Uri.https(APIConstants.baseUrl,APIConstants.popularApi,{
      "api_key": APIConstants.apiKey,
    });
    try{
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return PopularResponse.fromJson(json);
    }catch(e){throw e;}
  }

  static Future<TopRatedResponse> getTopRated() async {
    Uri url = Uri.https(APIConstants.baseUrl,APIConstants.topRatedApi,{
      "api_key": APIConstants.apiKey,
    });
    try{
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return TopRatedResponse.fromJson(json);
    }catch(e){throw e;}
  }

  static Future<UpComingResponse> getUpComing() async {
    Uri url = Uri.https(APIConstants.baseUrl,APIConstants.upComingApi,{
      "api_key": APIConstants.apiKey,
    });
    try{
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return UpComingResponse.fromJson(json);
    }catch(e){throw e;}
  }

  static Future<PopularResponse>  getSearch(String query) async {
    Uri url = Uri.https(APIConstants.baseUrl, APIConstants.popularApi, {
      "api_key": APIConstants.apiKey,
      'query': query,
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
}
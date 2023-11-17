
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie/firebase_Utils/firebase_utis.dart';
import 'package:movie/firebase_Utils/movieDm.dart';

class AppConfigProvider extends ChangeNotifier {
  List<MovieDM> watchList = [];

  void getAllMoviesFromFirestore() async {
    QuerySnapshot<MovieDM> querySnapshot =
    await FirebaseUtils.getMovieCollection().get();
    watchList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();

    notifyListeners();
  }


}
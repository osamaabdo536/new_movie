import 'package:cloud_firestore/cloud_firestore.dart';

import 'movieDm.dart';

class FirebaseUtils {
  static CollectionReference<MovieDM> getMovieCollection() {
   return FirebaseFirestore.instance
        .collection(MovieDM.collectionName)
        .withConverter<MovieDM>(
            fromFirestore: ((snapshot, options) =>
                MovieDM.fromFireStore(snapshot.data()!)),
            toFirestore: (movie, options) => movie.toFireStore());
  }

  static Future<void> addMovieToFirebase(MovieDM movie) {
    var movieCollection=getMovieCollection();
    DocumentReference<MovieDM> movieDocRef=movieCollection.doc();
 movie.Iid=movieDocRef.id;
 return movieDocRef.set(movie);
  }

}


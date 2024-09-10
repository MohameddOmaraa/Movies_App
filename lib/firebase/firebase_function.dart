import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app_c11/models/movie_model.dart';

class FirebaseFunction {
  static CollectionReference<Results> getSaveMovieCollection() {
    return FirebaseFirestore.instance
        .collection("Movies")
        .withConverter<Results>(
          fromFirestore: (snapshot, _) => Results.fromJson(snapshot.data()!),
          toFirestore: (result, _) => result.toJson(),
        );
  }

  static void addMovie({
    required Results? results,
  }) {
    var collection = getSaveMovieCollection();
    var docRef = collection.doc();

    // Assign the Firestore document ID to a new field (not to 'id' which is an int)

    results?.firestoreId = docRef.id;
    docRef.set(results!);

    // Save the movie to Firestore
  }

  static Stream<QuerySnapshot<Results>> getMovies() {
    CollectionReference<Results> collection = getSaveMovieCollection();

    return collection.snapshots();
  }

  static Future<void> deleteMovie(String id) async {
    return await getSaveMovieCollection().doc(id).delete();
  }
}

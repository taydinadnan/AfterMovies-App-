import 'package:aftermovietalk/models/ModelProvider.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';

class MovieListViewModel with ChangeNotifier {
  Stream<QuerySnapshot<Movie>> observeMovies() {
    return Amplify.DataStore.observeQuery(Movie.classType);
  }
}

import 'package:aftermovietalk/utils/view_utils.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';

import '../models/Message.dart';
import '../models/Movie.dart';

class MessageListViewModel with ChangeNotifier {
  Stream<QuerySnapshot<Message>> observeMessage(String movieId) {
    return Amplify.DataStore.observeQuery(Message.classType,
        where: Message.MOVIEID.eq(movieId));
  }

  Future<void> addMessage(String id, String message, String fromId,
      String movieId, String fromName) async {
    // get current time
    String time = ViewUtils.getCurrentTime();
    Message messageToSave = Message(
      message: message,
      fromId: fromId,
      movieId: movieId,
      timestamp: ViewUtils.getCurrentTime(),
      fromUsername: fromName,
      id: id,
    );
    await Amplify.DataStore.save(messageToSave);
    await updateMovieLatestMessage(movieId, message, time);
    notifyListeners();
  }

  Future<void> updateMovieLatestMessage(
      String movieId, String message, String time) async {
    // get movie
    Movie movie = (await Amplify.DataStore.query(Movie.classType,
        where: Movie.ID.eq(movieId)))[0];
    // update movie
    Movie updatedMovie = movie.copyWith(
        id: movie.id, latestMessage: message, latestMessageTime: time);

    // save
    await Amplify.DataStore.save(updatedMovie);
  }
}

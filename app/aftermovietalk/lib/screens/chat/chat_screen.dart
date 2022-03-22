import 'package:amplify_datastore/amplify_datastore.dart';

import 'package:flutter/material.dart';

import '../../models/Message.dart';
import '../../models/Movie.dart';
import '../movie_detail/movie_detail.dart';
import '../shared/custom_scaffold.dart';
import 'widget/message_list.dart';

class ChatScreen extends StatelessWidget {
  final Movie movie;
  final String currentUserId;
  final String username;
  final Stream<QuerySnapshot<Message>> messages;
  final Function sendMessage;

  ChatScreen(this.movie, this.currentUserId, this.messages, this.sendMessage,
      this.username);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        movie.title!,
        [
          Expanded(
              child: MessageList(
            currentUserId,
            messages,
            sendMessage,
            movie.id,
            username,
          ))
        ],
        navigateToMovieDetails(context),
        true);
  }

  Widget navigateToMovieDetails(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.movie),
        tooltip: 'Go to movie details',
        onPressed: () {
          Navigator.push(context, MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return MovieDetail(movie);
            },
          ));
        });
  }
}

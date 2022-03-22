import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../models/Message.dart';
import '../../../models/Movie.dart';
import '../../../utils/constants.dart';
import '../../../viewmodels/message_list_viewmodel.dart';
import '../../chat/chat_screen.dart';

class ChatList extends StatefulWidget {
  final Stream<QuerySnapshot<Movie>> movieQuery;
  final String currentUserId;
  final String username;
  final MessageListViewModel messageListViewModel;

  var movies = [];

  ChatList(this.movieQuery, this.currentUserId, this.messageListViewModel,
      this.username);

  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    widget.movieQuery.listen((event) {
      setState(() {
        widget.movies = event.items;
      });
    });

    return ListView.builder(
        itemCount: widget.movies.length,
        itemBuilder: (context, index) {
          var movie = widget.movies[index];
          var image = movie.img;

          return Card(
            child: ListTile(
              leading: CachedNetworkImage(
                imageUrl: Constants.imgUrl + image!,
                height: 50,
                width: 50,
              ),
              title: Text(movie.title!),
              subtitle: Text(getLatestMessage(movie)),
              onTap: () {
                navigateToChatScreen(movie);
              },
            ),
          );
        });
  }

  String getLatestMessage(Movie movie) {
    return movie.latestMessage!.isNotEmpty
        ? "Latest Message: " + movie.latestMessage!
        : "no messages";
  }

  Future<void> navigateToChatScreen(Movie movie) async {
    Stream<QuerySnapshot<Message>> messages =
        widget.messageListViewModel.observeMessage(movie.id);
    Function sendMessage = widget.messageListViewModel.addMessage;

    Navigator.push(context, MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return ChatScreen(movie, widget.currentUserId, messages, sendMessage,
            widget.username);
      },
    ));
  }
}

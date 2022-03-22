import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';

import '../../models/Movie.dart';
import '../../utils/view_utils.dart';
import '../../viewmodels/message_list_viewmodel.dart';
import '../login/login_screen.dart';
import '../shared/custom_scaffold.dart';
import 'widgets/chat_list.dart';

class ChatListScreen extends StatefulWidget {
  final String currentUserId;
  final String username;
  final Stream<QuerySnapshot<Movie>> movies;
  final MessageListViewModel messageListViewModel;

  ChatListScreen(this.currentUserId, this.movies, this.messageListViewModel,
      this.username);

  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        "Chats",
        <Widget>[
          const Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
          ),
          Expanded(
              child: ChatList(widget.movies, widget.currentUserId,
                  widget.messageListViewModel, widget.username)),
        ],
        logout(context),
        false);
  }
}

Widget logout(BuildContext context) {
  Future<void> performLogout() async {
    try {
      ViewUtils.showSnackBar(context, "Logging Out");
      await Amplify.Auth.signOut();
    } on AuthException catch (e) {
      ViewUtils.showSnackBar(context, e.message);
    }

    Navigator.push(context, MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return LoginScreen();
      },
    ));
  }

  return IconButton(
      icon: const Icon(Icons.logout),
      tooltip: 'Go to movie details',
      onPressed: () async {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to Logout'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => performLogout(),
                child: const Text('Yes'),
              ),
            ],
          ),
        );
      });
}

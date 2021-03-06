import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/Movie.dart';
import '../../../utils/view_utils.dart';
import '../../../viewmodels/message_list_viewmodel.dart';
import '../../../viewmodels/movie_list_viewmodel.dart';
import '../../chat_list/chat_list_screen.dart';
import '../../register/register_screen.dart';

class LoginBox extends StatefulWidget {
  LoginBox();

  @override
  _LoginBoxState createState() => _LoginBoxState();
}

class _LoginBoxState extends State<LoginBox> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmationCodeController = TextEditingController();

  Future<void> checkCurrentUser() async {
    try {
      AuthUser awsUser = await Amplify.Auth.getCurrentUser();
      navigationToChatScreen(awsUser.userId, awsUser.username);
    } on AuthException catch (e) {
      debugPrint("no user found");
    }
  }

  @override
  Widget build(BuildContext context) {
    checkCurrentUser();

    return SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/images/movie_reel.png', height: 80, width: 80),
        const Text(
          "Movie Talk",
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontFamily: 'Notable'),
        ),
        Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
            )),
        Padding(
          padding: const EdgeInsets.only(right: 12, left: 12, bottom: 12),
          child: TextField(
              obscureText: true,
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              )),
        ),
        TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red)),
            onPressed: login,
            child: const Text(
              "Login",
              style: TextStyle(color: Colors.white),
            )),
        TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey)),
            onPressed: register,
            child: const Text(
              "Register",
              style: TextStyle(color: Colors.white),
            ))
      ],
    ));
  }

  Future<void> login() async {
    ViewUtils.showSnackBar(context, "Logging In");

    try {
      SignInResult res = await Amplify.Auth.signIn(
        username: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      setState(() {
        if (res.isSignedIn) {
          checkCurrentUser();
        }
      });
    } on AuthException catch (e) {
      ViewUtils.showSnackBar(context, e.message);
    }
  }

  Future<void> navigationToChatScreen(String userId, String username) async {
    var movieViewModel =
        Provider.of<MovieListViewModel>(context, listen: false);
    var messageViewModel =
        Provider.of<MessageListViewModel>(context, listen: false);

    Stream<QuerySnapshot<Movie>> movies = movieViewModel.observeMovies();

    Navigator.push(context, MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return ChangeNotifierProvider(
          create: (_) => MessageListViewModel(),
          child: ChatListScreen(userId, movies, messageViewModel, username),
        );
      },
    ));
  }

  void register() {
    Navigator.push(context, MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return RegisterScreen();
      },
    ));
  }
}

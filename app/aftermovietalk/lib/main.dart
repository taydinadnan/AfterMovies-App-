import 'package:aftermovietalk/amplifyconfiguration.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/ModelProvider.dart';
import 'screens/login/login_screen.dart';
import 'viewmodels/message_list_viewmodel.dart';
import 'viewmodels/movie_list_viewmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  initState() {
    super.initState();
    if (!Amplify.isConfigured) {
      _configureAmplify();
      setState(() {});
      return;
    }
  }

  void _configureAmplify() async {
    // Add Pinpoint and Cognito Plugins, or any other plugins you want to use
    AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
    AmplifyDataStore datastorePlugin =
        AmplifyDataStore(modelProvider: ModelProvider.instance);
    await Amplify.addPlugins([authPlugin, datastorePlugin, AmplifyAPI()]);

    try {
      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      print(
          "Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MovieTalk',
      theme: ThemeData(primarySwatch: Colors.red, fontFamily: 'OpenSans'),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => MovieListViewModel(),
          ),
          ChangeNotifierProvider(
            create: (_) => MessageListViewModel(),
          )
        ],
        child: LoginScreen(),
      ),
    );
  }
}

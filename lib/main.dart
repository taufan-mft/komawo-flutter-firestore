import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:komawo/services/service_locator.dart';
import 'package:komawo/ui/login/login_ui.dart';
import 'package:komawo/ui/main_menu/main_menu_ui.dart';
import 'package:komawo/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void initializeFlutterFire() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool? loggedIn = await prefs.getBool(KEY_LOGIN);

      if (loggedIn!) {
        Navigator.pushAndRemoveUntil(
            context,
            CupertinoPageRoute(builder: (context) => MainMenuUi()),
            ModalRoute.withName('/tania'));
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            CupertinoPageRoute(builder: (context) => LoginUi()),
            ModalRoute.withName('/tania'));
      }
    } catch(e) {
      log(e.toString());
    }
  }
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
@override
void initState() {
  initializeFlutterFire();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

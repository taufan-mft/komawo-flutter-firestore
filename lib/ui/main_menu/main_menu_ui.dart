import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:komawo/ui/about/about_ui.dart';
import 'package:komawo/ui/list_package/package_modern_ui.dart';
import 'package:komawo/ui/list_package/package_traditional_ui.dart';
import 'package:komawo/ui/login/login_ui.dart';
import 'package:komawo/ui/main_menu/widgets/package_card.dart';
import 'package:komawo/ui/profile/profile_ui.dart';
import 'package:komawo/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainMenuUi extends StatefulWidget {
  const MainMenuUi({Key? key}) : super(key: key);

  @override
  _MainMenuUiState createState() => _MainMenuUiState();
}

class _MainMenuUiState extends State<MainMenuUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Package List'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                PackageCard(
                  title: 'Modern',
                  imageUrl: '👗',
                  destination: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => PackageModernUi()));
                  },
                ),
                PackageCard(
                    title: 'Traditional',
                    imageUrl: '👗',
                    destination: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => PackageTraditionalUi()));
                    }),
                PackageCard(
                    title: 'Profile',
                    imageUrl: '👗',
                    destination: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => ProfileUi()));
                    }),
                PackageCard(
                    title: 'About Us',
                    imageUrl: '👗',
                    destination: () {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) => AboutUi()));
                    }),
                PackageCard(
                    title: 'Logout',
                    imageUrl: '🚪',
                    destination: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setBool(KEY_LOGIN, false);
                      Navigator.pushAndRemoveUntil(
                          context,
                          CupertinoPageRoute(builder: (context) => LoginUi()),
                          ModalRoute.withName('/'));
                    })
              ],
            ),
          ),
        ));
  }
}

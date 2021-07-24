
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:komawo/ui/list_package/package_modern_ui.dart';
import 'package:komawo/ui/main_menu/widgets/package_card.dart';

class MainMenuUi extends StatefulWidget {
  const MainMenuUi({Key? key}) : super(key: key);

  @override
  _MainMenuUiState createState() => _MainMenuUiState();
}

class _MainMenuUiState extends State<MainMenuUi> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
        title: Text('Package List'),
    ),
    body: SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 10,),
            PackageCard(title: 'Modern', imageUrl: '👗', destination: () {Navigator.push(context, CupertinoPageRoute(builder: (context) =>PackageModernUi()));},),
            PackageCard(title: 'Modern', imageUrl: '👗', destination: () {Navigator.push(context, CupertinoPageRoute(builder: (context) =>PackageModernUi()));}),
            PackageCard(title: 'Modern', imageUrl: '👗', destination: () {Navigator.push(context, CupertinoPageRoute(builder: (context) =>PackageModernUi()));}),
            PackageCard(title: 'Modern', imageUrl: '👗', destination: () {Navigator.push(context, CupertinoPageRoute(builder: (context) =>PackageModernUi()));}),
          ],
        ),
      ),
    )
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:komawo/data/package_maker.dart';
import 'package:komawo/ui/list_package/package_info.dart';
import 'package:komawo/ui/package_detail/package_detail_ui.dart';

class PackageModernUi extends StatefulWidget {
  const PackageModernUi({Key? key}) : super(key: key);

  @override
  _PackageModernUiState createState() => _PackageModernUiState();
}

class _PackageModernUiState extends State<PackageModernUi> {
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
                PackageInfo(
                  price: 'IDR 500.000.000',
                  title: 'Package Modern 1',
                  imageUrl: 'assets/images/modern1.jpeg',
                  destinationOrder: () => Container(),
                  destinationRead: () => Navigator.push(context, CupertinoPageRoute(builder: (context) =>PackageDetailUi(pkg: PackageMaker.modern1))),
                ),
                PackageInfo(
                  price: 'IDR 500.000.000',
                  title: 'Package Modern 2',
                  imageUrl: 'assets/images/modern2.jpeg',
                  destinationOrder: () => Container(),
                  destinationRead: () => Navigator.push(context, CupertinoPageRoute(builder: (context) =>PackageDetailUi(pkg: PackageMaker.modern2))),
                )
              ],
            ),
          ),
        ));
  }
}

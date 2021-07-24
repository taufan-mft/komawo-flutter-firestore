import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:komawo/data/package_maker.dart';
import 'package:komawo/ui/list_package/package_info.dart';
import 'package:komawo/ui/order_now/order_now_ui.dart';
import 'package:komawo/ui/package_detail/package_detail_ui.dart';

class PackageTraditionalUi extends StatelessWidget {
  const PackageTraditionalUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Package Traditional'),
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
                  title: 'Package Traditional 1',
                  imageUrl: 'assets/images/tradisional1.jpeg',
                  destinationOrder: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) =>
                              OrderNowUi(pkg: PackageMaker.traditional1))),
                  destinationRead: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) =>
                              PackageDetailUi(pkg: PackageMaker.traditional1))),
                ),
                PackageInfo(
                  price: 'IDR 500.000.000',
                  title: 'Package Traditional 2',
                  imageUrl: 'assets/images/tradisional2.jpeg',
                  destinationOrder: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) =>
                              OrderNowUi(pkg: PackageMaker.traditional2))),
                  destinationRead: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) =>
                              PackageDetailUi(pkg: PackageMaker.traditional2))),
                )
              ],
            ),
          ),
        ));
  }
}

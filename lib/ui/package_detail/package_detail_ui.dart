import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:komawo/data/package_model.dart';
import 'package:komawo/ui/order_now/order_now_ui.dart';

class PackageDetailUi extends StatefulWidget {
  final PackageModel pkg;

  const PackageDetailUi({Key? key, required this.pkg}) : super(key: key);

  @override
  _PackageDetailUiState createState() => _PackageDetailUiState();
}

class _PackageDetailUiState extends State<PackageDetailUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pkg.title),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.87,
                    child: Column(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                            ),
                            child: Image.asset(
                              widget.pkg.imageUrl,
                              height: 250,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            )),
                        Padding(
                          padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          child: Text(
                            widget.pkg.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Detail',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16
                                ),
                              )),
                        ),
                        Text('PRICE'),
                        Text(widget.pkg.price,
                          style: TextStyle(fontSize: 16),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Inclusion',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16
                                ),
                              )),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                widget.pkg.content,
                                textAlign: TextAlign.left,
                              )),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 0.8,
                                    36),
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                ),
                                primary: Colors.pinkAccent),
                            child: Text('Order Now'),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) =>
                                          OrderNowUi(pkg: widget.pkg)));
                            }),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    )))),

      ),
    );
  }
}

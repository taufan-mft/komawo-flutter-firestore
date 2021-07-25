import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:komawo/data/package_model.dart';
import 'package:komawo/ui/payment/payment_ui.dart';

class OrderNowUi extends StatefulWidget {
  final PackageModel pkg;

  const OrderNowUi({Key? key, required this.pkg}) : super(key: key);

  @override
  _OrderNowUiState createState() => _OrderNowUiState();
}

class _OrderNowUiState extends State<OrderNowUi> {
  String? tanggal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Order Now'),
        ),
        body: Center(
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.87,
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            widget.pkg.imageUrl,
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          )),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                        child: Text(
                          widget.pkg.title,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          widget.pkg.shortDesc,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                        child: Text(
                          widget.pkg.price,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                        child: Text(
                            'Before we proceed to the payment, please fill in your service date:'),
                      ),
                      Padding(
                          padding: EdgeInsets.all(8),
                          child: TextFormField(
                              onChanged: (text) {
                                widget.pkg.tanggal = text;
                              },
                              keyboardType: TextInputType.datetime,
                              enableSuggestions: false,
                              autocorrect: false,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  labelText: 'Tanggal',
                                  border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                      borderSide: new BorderSide())))),
                      Expanded(
                        child: Container(),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width * 0.8, 36),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                              ),
                              primary: Colors.pinkAccent),
                          child: Text('Pay now, ${widget.pkg.price}'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => PaymentUi(
                                          pkg: widget.pkg,
                                        )));
                          })
                    ],
                  ),
                ))));
  }
}

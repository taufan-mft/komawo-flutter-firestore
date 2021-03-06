import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:komawo/data/package_model.dart';
import 'package:komawo/services/service_locator.dart';
import 'package:komawo/ui/payment/payment_viewmodel.dart';

class PaymentUi extends StatefulWidget {
  final PackageModel pkg;

  const PaymentUi({Key? key, required this.pkg}) : super(key: key);

  @override
  _PaymentUiState createState() => _PaymentUiState();
}

class _PaymentUiState extends State<PaymentUi> {
  String _paymentMethod = 'Ovo';
  PaymentViewModel model = serviceLocator<PaymentViewModel>();

  @override
  void initState() {
    super.initState();
    model.setPackage(widget.pkg);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Payment Method'),
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
                      ListTile(
                        title: const Text('Ovo'),
                        leading: Radio<String>(
                          value: 'Ovo',
                          groupValue: _paymentMethod,
                          onChanged: (String? value) {
                            setState(() {
                              _paymentMethod = value!;
                              model.pkg.bayar = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Link Aja'),
                        leading: Radio<String>(
                          value: 'Link Aja',
                          groupValue: _paymentMethod,
                          onChanged: (String? value) {
                            setState(() {
                              _paymentMethod = value!;
                              model.pkg.bayar = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Bank Transfer'),
                        leading: Radio<String>(
                          value: 'Bank Transfer',
                          groupValue: _paymentMethod,
                          onChanged: (String? value) {
                            setState(() {
                              _paymentMethod = value!;
                              model.pkg.bayar = value;
                            });
                          },
                        ),
                      ),
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
                            model.doPayment();
                          })
                    ],
                  ))),
        ));
  }
}

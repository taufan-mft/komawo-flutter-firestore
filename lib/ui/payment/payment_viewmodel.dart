import 'package:flutter/foundation.dart';
import 'package:komawo/data/package_model.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentViewModel extends ChangeNotifier {
  late PackageModel pkg;

  void setPackage(PackageModel pkgs) {
    pkg = pkgs;
  }

  void doPayment() async {
    final Uri whatsappUri = Uri(
        scheme: 'https',
        host: 'wa.me',
        path: '6281390633824',
        queryParameters: {
          'text':
              'Selesaikan pembayaran untuk ${pkg.title} untuk tanggal ${pkg.tanggal} sejumlah ${pkg.price} melalui ${pkg.bayar}.'
        });

    if (await canLaunch(whatsappUri.toString())) {
      await launch((whatsappUri.toString()));
    } else {
      throw 'Could not launch ${whatsappUri.toString()}';
    }
  }
}

import 'package:flutter/foundation.dart';
import 'package:komawo/data/firestore_service.dart';
import 'package:komawo/data/user_model.dart';
import 'package:komawo/services/service_locator.dart';

class RegisterViewModel extends ChangeNotifier {
  UserModel user =
      UserModel(name: '', phone: '', password: '', gender: 'male', email: '');
  final FireStoreService _fireStore = serviceLocator<FireStoreService>();
  bool loading = false;

  Future<bool> sendUser() async {
    loading = true;
    notifyListeners();
    String status = await _fireStore.sendUserData({
      'name': user.name,
      'phone': user.phone,
      'password': user.password,
      'gender': user.gender,
      'email': user.email
    });
    if (status != 'null') {
      loading = false;
      notifyListeners();
      return true;
    } else {
      loading = true;
      notifyListeners();
      return false;
    }
  }
}

import 'package:flutter/foundation.dart';
import 'package:komawo/data/firestore_service.dart';
import 'package:komawo/data/user_model.dart';
import 'package:komawo/services/service_locator.dart';
import 'package:komawo/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileViewModel extends ChangeNotifier {
  final FireStoreService _fireStore = serviceLocator<FireStoreService>();

  UserModel user = UserModel(name: '', gender: '', email: '', phone: '');
  bool loading = true;

  void getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString(KEY_ID);
    user = await _fireStore.getUser(id!);
    loading = false;
    notifyListeners();
  }

  Future<void> updateUser() async {
    loading = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString(KEY_ID);
    await _fireStore.updateUser({
      'name': user.name,
      'email': user.email,
      'gender': user.gender,
      'phone': user.phone
    }, id!);
    loading = false;
    notifyListeners();
  }
}

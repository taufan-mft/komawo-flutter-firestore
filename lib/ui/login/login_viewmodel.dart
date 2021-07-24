
import 'package:flutter/foundation.dart';
import 'package:komawo/data/firestore_service.dart';
import 'package:komawo/services/service_locator.dart';
import 'package:komawo/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends ChangeNotifier {

  final FireStoreService _fireStore = serviceLocator<FireStoreService>();
  String _id = '-';
 String get id => _id;

 Function nyobaFunction = (){};

 void setFunction( function()) {
   nyobaFunction = function;
 }

 Future<bool> getUser(String email, String password) async {
   _id = 'Mohon tunggu...';
   notifyListeners();
 _id = await _fireStore.getUserId(email, password);

  if (_id == '-') {
    _id = 'User tidak ditemukan';
    notifyListeners();
    return false;
  } else {
    nyobaFunction();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(KEY_LOGIN, true);
    prefs.setString(KEY_ID, _id);
    _id = 'Ketemu! Mohon Tunggu...';
    notifyListeners();
    return true;


  }


  }
}
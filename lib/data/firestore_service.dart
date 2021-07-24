import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:komawo/data/user_model.dart';

/*
users collection structure : ID=email
email:
password:
gender:
phone:

 */
class FireStoreService {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Future<String> getUserId(String email, String password) async {

    String id = '-';
    await users.where('email', isEqualTo: email)
        .where('password', isEqualTo: password)
        .limit(1)
        .get().then((QuerySnapshot querySnapshot) {
          log("farinn");
    if (querySnapshot.docs.length != 0) {
      log(querySnapshot.docs[0].id);
      id = querySnapshot.docs[0].id;
    } else {
     id = '-';
    }
    });
    return id;
  }

  Future<String> sendUserData(Map<String, dynamic> userData) async {
    var oke = "null";
    var check = await users.where('email', isEqualTo: userData['email'])
    .limit(1).get();

    if (check.docs.length == 0) {
      await users.add(userData).then((value) {
        oke = value.id;
      });
    }
    return oke;
  }

  Future<UserModel> getUser(String id) async {
    var user = UserModel(name: '', gender: '', email: '', phone: '');
    await users.doc(id).get().then((value) {
      log(value['email']);
      user = UserModel(
          name: value['name'],
          gender: value['gender'],
          email: value['email'],
          phone: value['phone']);
    });

    return user;
  }

  Future<void> updateUser(Map<String, dynamic> user, String id) async {
    await users.doc(id).update(user);
  }
}
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

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
      }
      );
    }
return oke;
  }


}
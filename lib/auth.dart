import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';

final FirebaseAuth auth = FirebaseAuth.instance;

 userData() {
    final User user = auth.currentUser;
    if (user == null) {
      return null;
    } else {
      return user;
    }
  }

  Future<void> signOut() async {
     await auth.signOut();
}
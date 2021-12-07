import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class Database {
  dataByYear(int year) async {
    var result = await FirebaseFirestore.instance
        .collection('content')
        .where('year', isEqualTo: year)
        .get()
        .catchError((e) {
      print(e);
    });

    return result.docs;
  }

  ///TODO:Complete it
  addFav(String title, String username) {
    var result = FirebaseFirestore.instance
        .collection('userContent')
        .where('username', isEqualTo: title)
        .get();
  }

  dataBySubtitle(String events) async {
    var result = await FirebaseFirestore.instance
        .collection('content')
        .where('subtitle', isEqualTo: events)
        .get()
        .catchError((e) {
      print(e);
    });

    return result.docs;
  }

  dataByTitle(String events) async {
    var result = await FirebaseFirestore.instance
        .collection('content')
        .where('title', isEqualTo: events)
        .get()
        .catchError((e) {
      print(e);
    });

    return result.docs;
  }

  getUsername(String email) async {
    var result = await FirebaseFirestore.instance
        .collection('userContent')
        .where('email', isEqualTo: email)
        .get()
        .catchError((e) {
      print(e);
    });
    var username = result.docs[0].data()['username'];
    return username;
  }

  uploadUserInfo(userMap) async {
    await FirebaseFirestore.instance
        .collection('userContent')
        .add(userMap)
        .catchError((e) {
      print("Error $e");
    });
  }

  getUserData(String username) async {
    var result = await FirebaseFirestore.instance
        .collection('userContent')
        .where('username', isEqualTo: username)
        .get()
        .catchError((e) {
      print(e);
    });

    return result.docs[0].data();
  }
}

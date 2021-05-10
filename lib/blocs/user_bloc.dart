import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserBloc extends ChangeNotifier {
  String _name;
  String get name => _name;
  set setName(newName) => _name = newName;

  String _uid;
  String get uid => _uid;
  set setUid(newUid) => _uid = newUid;

  String _email;
  String get email => _email;
  set setEmail(newEmail) => _email = newEmail;

  String _photoUrl;
  String get photoUrl => _photoUrl;
  set setPhotoUrl(newPhotoUrl) => _photoUrl = newPhotoUrl;

  List _reservedList = [];
  set reservedList(newValue) => _reservedList = newValue;
  List get reservedList => _reservedList;
  
  

  UserBloc() {
    getUserFirestore();
  }

  getUserFirestore() async {
    final SharedPreferences localDb = await SharedPreferences.getInstance();
    String _userUid = localDb.getString('uid');
    try {
      await Firestore.instance
          .collection('users')
          .document(_userUid)
          .get()
          .then((DocumentSnapshot snap) {
        _uid = snap.data['uid'];
        _name = snap.data['displayName'];
        _email = snap.data['email'];
        _photoUrl = snap.data['photoUrl'];

      });
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }

  void addToUserReserve(slotId) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String _uid = sp.getString('uid');
    final DocumentReference ref =
    Firestore.instance.collection('users').document(_uid);

    String timestamp = await _getDate();
    List firstItem = [slotId];

    if (_reservedList == null) {
      ref.updateData({'reservedList': FieldValue.arrayUnion(firstItem)});
    } else {
      _reservedList.add(slotId);
      ref.updateData(
          {'reservedList': FieldValue.arrayUnion(_reservedList)});
    }
    notifyListeners();
  }

  Future _getDate() async {
    DateTime now = DateTime.now();
    String _date = DateFormat('dd MMMM yyyy').format(now);
    String _timestamp = DateFormat('yyyyMMddHHmmss').format(now);

    return _timestamp;
  }

  Future getReservedList() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String _uid = localStorage.getString('uid');

    final DocumentReference ref =
    Firestore.instance.collection('users').document(_uid);
    DocumentSnapshot snap = await ref.get();
    List d = snap.data['reservedList'];
    _reservedList = d;

    notifyListeners();
  }

  void removeFromReservedList(spaceId) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String _uid = sp.getString('uid');
    final DocumentReference ref =
    Firestore.instance.collection('users').document(_uid);
    List d = [spaceId];
    ref.updateData({'reservedList': FieldValue.arrayRemove(d)});
    getReservedList();
    notifyListeners();
  }
}

abstract class ListInboxItem {
  String get name;

  String get photoUrl;
  String get id;

  Widget buildTitle(BuildContext context);

  Widget buildImage(BuildContext context);
}

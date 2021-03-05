import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
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

  String _bio;
  String get bio => _bio;
  set setBio(newBio) => _bio = newBio;

  String _location;
  String get location => _location;
  set setLocation(newLocation) => _location = newLocation;

  String _position;
  String get position => _position;
  set setPosition(newPosition) => _position = newPosition;

  String _organization;
  String get organization => _organization;
  set setOrganization(newOrganization) => _organization = newOrganization;

  List _interests = [];
  List get interests => _interests;
  set setInterests(newInterests) => _interests = newInterests;

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
        _interests = List.from(snap.data['interests']);
        _location = snap.data['location'];
        _organization = snap.data['organization'];
        _bio = snap.data['bio'];
        _position = snap.data['position'];
      });
    } catch (e) {
      print(e);
    }

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

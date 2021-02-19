import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthBloc extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;
  set isSignedIn(newVal) => _isSignedIn = newVal;

  bool _hasError = false;
  bool get hasError => _hasError;
  set hasError(newError) => _hasError = newError;

  bool _userExists = false;
  bool get userExists => _userExists;
  set setUserExist(bool value) => _userExists = value;

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
  set setImageUrl(newImageUrl) => _photoUrl = newImageUrl;

  AuthBloc() {
    isLoggedIn();
  }

  void isLoggedIn() async {
    final SharedPreferences localDb = await SharedPreferences.getInstance();
    _isSignedIn = localDb.getBool('login') ?? false;
    notifyListeners();
  }

  Future setSignInStatus() async {
    final SharedPreferences localDb = await SharedPreferences.getInstance();
    localDb.setBool('login', true);
    notifyListeners();
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      final result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      final FirebaseUser user = result.user;
      this._name = user.displayName ?? "";
      this._email = user.email ?? "";
      this._photoUrl = user.photoUrl ?? "";
      this._uid = user.uid;
      if (user.uid != null && user.uid != "") {
        this._uid = user.uid;
        _hasError = false;
      } else
        _hasError = true;
      notifyListeners();
    } catch (e) {
      _hasError = true;
      notifyListeners();
    }
  }

  Future userExistCheck() async {
    await Firestore.instance
        .collection('users')
        .getDocuments()
        .then((QuerySnapshot snap) {
      List values = snap.documents;
      List userIds = [];
      values.forEach((element) {
        userIds.add(element['uid']);
      });
      if (userIds.contains(_uid)) {
        _userExists = true;
      } else {
        _userExists = false;
      }
      notifyListeners();
    });
  }

  Future<void> signInWithGoogle(context) async {
    final GoogleSignInAccount googleUser = await _googleSignIn
        .signIn()
        .catchError((error) => print('error : $error'));
    if (googleUser != null) {
      try {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.getCredential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        FirebaseUser userDetails =
            (await _firebaseAuth.signInWithCredential(credential)).user;

        this._name = userDetails.displayName;
        this._email = userDetails.email;
        this._photoUrl = userDetails.photoUrl;
        this._uid = userDetails.uid;
        if (userDetails.uid != null || userDetails.uid != "") {
          this._uid = userDetails.uid;
          _hasError = false;
        } else
          _hasError = true;
        notifyListeners();
      } catch (e) {
        _hasError = true;

        notifyListeners();
      }
    } else {
      _hasError = true;
      notifyListeners();
    }
  }

  Future addUserToFirestoreDatabase() async {
    final DocumentReference ref =
        Firestore.instance.collection('users').document(uid);
    await ref.setData({
      'uid': uid,
      'email': email,
      'displayName': name,
      'photoUrl': photoUrl,
    });
  }

  Future setUidToLocalStorage() async {
    SharedPreferences localDb = await SharedPreferences.getInstance();
    await localDb.setString('uid', _uid);
    await localDb.setString('photoUrl', _photoUrl);
    await localDb.setString('name', _name);
  }

  Future<void> signUpWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      final FirebaseUser user = result.user;
      this._name = name ?? "";
      this._email = user.email ?? "";
      this._photoUrl = user.photoUrl ?? "";
      this._uid = user.uid;

      _hasError = false;
      notifyListeners();

      return true;
    } catch (e) {
      _hasError = true;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    print('Signed out');
    clearAllData();
    _isSignedIn = false;
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
  }

  void clearAllData() async {
    final SharedPreferences localDb = await SharedPreferences.getInstance();
    localDb.clear();
  }
}

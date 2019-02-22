// firebase
import 'package:firebase/firebase.dart' as firebase;
import 'dart:async';

class UserService {
  dynamic refToUsersCollect() {
    return firebase.firestore().collection('users');
  }

  void addUser(Map<String, dynamic> user) {
    refToUsersCollect().add(user);
  }

  Future getAllUsers() async {
    return await refToUsersCollect()
        .get()
        .then((snapshot) => snapshot.docs)
        .then((docs) => docs.toList());
  }

  dynamic refToFireAuth(){
    return firebase.auth();
  }

  Future signUpWithFireAuth(Map<String, dynamic> user) {
    return refToFireAuth().createUserWithEmailAndPassword(user['email'], user['password']);
  }

  Future signInWithFireAuth(Map<String, dynamic> user){
    return refToFireAuth().signInWithEmailAndPassword(user['email'], user['password']);
  }

  
}

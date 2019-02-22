import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import '../../services/userService.dart';
import '../../routes/routes.dart';
import 'dart:async';
import 'dart:html';

@Component(
    selector: 'signin',
    templateUrl: 'signin.html',
    styleUrls: ['signin.css'],
    directives: [coreDirectives, formDirectives])
class SignInComponent {
  final UserService _userService;
  final Router _router;
  SignInComponent(this._userService, this._router);

  void signin(Map<String, dynamic> user) async {
    if (checkEmpty(user)) {
      var u =await this._userService.signInWithFireAuth(user).then((u) => u.user);
      if (u.emailVerified == true)
        this._router.navigate(Routes.homepage.toUrl());
      else {
        window.alert('Please check your mail and verify it, then login again!');
        u.sendEmailVerification();
      }
    } else{
      querySelector('#email').classes.add('empty');
      querySelector('#password').classes.add('empty');
      window.alert('Email & Password must not empty!!');
    };
  }

  bool checkEmpty(Map<String, dynamic> user) {
    return (user['email'] != '' && user['password'] != '');
  }
}

// cores
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'dart:html';

// routers
import 'package:angular_router/angular_router.dart';
import '../../routes/routes.dart';

// services
import '../../services/userService.dart';

@Component(
    selector: 'signin',
    templateUrl: 'signin.html',
    styleUrls: ['signin.css'],
    directives: [coreDirectives, formDirectives])
class SignInComponent {
  final UserService _userService;
  final Router _router;
  SignInComponent(this._userService, this._router);

  void signin(Map<String, dynamic> user) {
    if (checkEmpty(user)) {
      this._userService.signInWithFireAuth(user).then((u) {
        if (u.user.emailVerified == true)
          this._router.navigate(Routes.homepage.toUrl());
        else {
          window.alert(
              'We now need to verify your email address. We\'ve sent an email to ${u.user.email} to verify your address. Please click the link in that email to continue');
          u.user.sendEmailVerification();
        }
      }).catchError(
          (onError) => window.alert('email or password is incorrect, please check again!'));
    } else {
      querySelector('#email').classes.add('empty');
      querySelector('#password').classes.add('empty');
      window.alert('email or password must not empty!!');
    }
    ;
  }

  bool checkEmpty(Map<String, dynamic> user) {
    return (user['email'] != '' && user['password'] != '');
  }
}

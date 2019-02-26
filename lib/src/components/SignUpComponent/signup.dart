// cores
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'dart:html';

// routers
import 'package:angular_router/angular_router.dart';
import '../../services/userService.dart';

// email validator
import 'package:email_validator/email_validator.dart';
import '../../routes/routes.dart';

// crypto
import 'package:dbcrypt/dbcrypt.dart';

// user
import '../../models/UserCore.dart';

@Component(
  selector: 'signup',
  templateUrl: 'signup.html',
  styleUrls: ['signup.css'],
  directives: [coreDirectives, formDirectives],
)
class SignUpComponent {
  final UserService _userService;
  final Router _router;
  SignUpComponent(this._userService, this._router);

  bool submitted = false;
  UserCore user = UserCore('', '', '', '', '', '', '', '');

  clear() {
    user = UserCore('', '', '', '', '', '', '', '');
  }

  bool isTrue;
  isEqual(bool isEqual) {
    isTrue = isEqual;
  }

  void onSubmit(Map<String, dynamic> user) {
    submitted = true;
    if (user['password'] != user['repassword']) {
      window.alert('Your password and confirmation password do not match!!');
      return;
    }
    if (checkValid(user) == false) {
      window.alert('invalid email');
      return;
    }
    this._userService.signUpWithFireAuth(user).whenComplete(() {
      window.alert('User has been created');
      this._router.navigate(Routes.signin.toUrl());
    }).then((u) {
      String hashedPassword =
          new DBCrypt().hashpw(user['password'], new DBCrypt().gensalt());
      user['password'] = hashedPassword;
      this._userService.addUser(user);
    }).catchError((onError) => print(onError));
  }

  bool checkValid(Map<String, dynamic> user) {
    return EmailValidator.validate(user['email']) == true;
  }
}

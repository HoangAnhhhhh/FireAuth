import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:email_validator/email_validator.dart';
import '../../routes/routes.dart';
import '../../services/userService.dart';
import 'package:dbcrypt/dbcrypt.dart';
import 'dart:html';

@Component(
    selector: 'signup',
    templateUrl: 'signup.html',
    styleUrls: ['signup.css'],
    directives: [coreDirectives, formDirectives])
class SignUpComponent implements OnInit {
  final UserService _userService;
  final Router _router;
  SignUpComponent(this._userService, this._router);

  void signup(Map<String, dynamic> user) {
    if (checkEmpty(user)) {
      if (checkValid(user) == false) {
        window.alert('invalid email');
        return;
      }
      this._userService.signUpWithFireAuth(user).whenComplete(() {
        this._router.navigate(Routes.signin.toUrl());
      }).then((u) {
        var hashedPassword = new DBCrypt().hashpw(user['password'], new DBCrypt().gensalt());
        user['password'] =hashedPassword;
        this._userService.addUser(user);
      }).catchError((onError) => print(onError));
    } else {
      window.alert('You have to fullfill the form');
    }
  }

  bool checkEmpty(Map<String, dynamic> user) {
    return (user['firstname'] != '' &&
        user['lastname'] != '' &&
        user['middlename'] != '' &&
        user['email'] != '' &&
        user['password'] != '' &&
        user['phonenumber'] != '');
  }

  bool checkValid(Map<String, dynamic> user) {
    return EmailValidator.validate(user['email']) == true;
  }

  void ngOnInit() {}
}

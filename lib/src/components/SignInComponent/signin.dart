// cores
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'dart:html';

// routers
import 'package:angular_router/angular_router.dart';
import '../../routes/routes.dart';

// services
import '../../services/userService.dart';

import '../../models/UserCore.dart';

@Component(
  selector: 'signin',
  templateUrl: 'signin.html',
  styleUrls: ['signin.css'],
  directives: [coreDirectives, formDirectives, routerDirectives],
  exports: [RoutePaths, Routes],
)
class SignInComponent implements OnInit {
  final UserService _userService;
  final Router _router;

  SignInComponent(this._userService, this._router);

  UserCore user = UserCore('', '', '', '', '', '', '', '');

  void onSubmit(Map<String, dynamic> user) {
    this._userService.signInWithFireAuth(user).then((u) {
      if (u.user.emailVerified == true)
        this._router.navigate(Routes.homepage.toUrl());
      else {
        window.alert(
            'We now need to verify your email address. We\'ve sent an email to ${u.user.email} to verify your address. Please click the link in that email to continue');
        u.user.sendEmailVerification();
      }
    }).catchError((onError) =>
        window.alert('email or password is incorrect, please check again!'));
  }

  @override
  void ngOnInit() {
    RegExp reg = new RegExp(r"iPhone|iPad|iPod|Android");
    bool isMobile = reg.hasMatch(window.navigator.userAgent);
    if (isMobile) {
      window.alert("You are using Mobile");
    } else {
      window.alert("You are using Desktop");
    }
  }
}

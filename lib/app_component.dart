import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'src/services/userService.dart';
import 'package:angular_router/angular_router.dart';
import 'src/routes/routes.dart';
// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [coreDirectives, formDirectives, routerDirectives],
  providers: [ClassProvider(UserService)],
  exports: [RoutePaths, Routes]
)
class AppComponent{
}

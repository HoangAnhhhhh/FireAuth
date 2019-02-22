// cores
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

// services
import 'src/services/userService.dart';

// routers
import 'package:angular_router/angular_router.dart';
import 'src/routes/routes.dart';

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [routerDirectives],
  providers: [ClassProvider(UserService)],
  exports: [RoutePaths, Routes]
)
class AppComponent{
}

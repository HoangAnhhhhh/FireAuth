// cores
import 'package:angular_router/angular_router.dart';

// routers
import 'route_paths.dart';

// components
import '../components/SignInComponent/signin.template.dart' as signin_template;
import '../components/SignUpComponent/signup.template.dart' as signup_template;
import '../components/HomePageComponent/homepage.template.dart' as homepage_template;
import '../components/Database/database.template.dart' as database_template;

export 'route_paths.dart';

class Routes {
  static final signin = RouteDefinition(
      routePath: RoutePaths.signin,
      component: signin_template.SignInComponentNgFactory,
      useAsDefault: true);

  static final signup = RouteDefinition(
      routePath: RoutePaths.signup,
      component: signup_template.SignUpComponentNgFactory);

  static final homepage = RouteDefinition(
      routePath: RoutePaths.homepage,
      component: homepage_template.HomePageComponentNgFactory);

  static final database = RouteDefinition(
      routePath: RoutePaths.database,
      component: database_template.DatabaseComponentNgFactory);

  static final all = <RouteDefinition>[signin, signup, homepage, database];
}

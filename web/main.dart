// core libraries
import 'package:angular/angular.dart';
import 'package:FireAuth/app_component.template.dart' as ng;
import 'package:angular_router/angular_router.dart';
// firebase library
import 'package:firebase/firebase.dart' show initializeApp;

import 'main.template.dart' as self;

@GenerateInjector(
  routerProvidersHash, // You can use routerProviders in production
)
final InjectorFactory injector = self.injector$Injector;

void main() {
  // everything should go first runApp() function
  initializeApp(
      apiKey: "AIzaSyDVpGijiU0pWL7H8enaKnHO1QFDsytQpqk",
      authDomain: "beta-for-everything.firebaseapp.com",
      databaseURL: "https://beta-for-everything.firebaseio.com",
      projectId: "beta-for-everything",
      storageBucket: "beta-for-everything.appspot.com",
      messagingSenderId: "708920407481");

  runApp(ng.AppComponentNgFactory, createInjector: injector);
}

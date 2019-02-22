import 'package:angular/angular.dart';
import '../../services/userService.dart';
@Component(
  selector: 'homepage',
  templateUrl: 'homepage.html',
  directives: [coreDirectives]
)

class HomePageComponent implements OnInit{
  final UserService _userService;
  HomePageComponent(this._userService);

  Map<String, dynamic> user =new Map();

  void ngOnInit(){
    var currentUser = this._userService.refToFireAuth().currentUser;
    user['email'] =currentUser.email;
    user['verified'] =currentUser.emailVerified;
  }
}
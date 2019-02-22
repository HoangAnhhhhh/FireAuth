// cores
import 'package:angular/angular.dart';

// services
import '../../services/userService.dart';

@Component(
  selector: 'database',
  templateUrl: 'database.html',
  directives: [coreDirectives]
)

class DatabaseComponent implements OnInit{
  final UserService _userService;
  DatabaseComponent(this._userService);

  List<dynamic> users = [];

  void ngOnInit(){
    this._userService.getAllUsers().then((user){
      users.addAll(user);
    });
  }
}
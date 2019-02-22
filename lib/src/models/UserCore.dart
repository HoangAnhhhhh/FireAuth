class UserCore {
  String uid;
  String firstname;
  String middlename;
  String familyname;
  String email;
  String phonenumber;

  UserCore(dynamic map) {
    uid = '1';
    firstname = map['firstname'];
    middlename = map['middlename'];
    familyname = map['familyname'];
    email = map['email'];
    phonenumber = map['phonenumber'];
  }

  dynamic toMap() {
    return {
      'uid':'1',
      'firstname': firstname,
      'middlename': middlename,
      'familyname': familyname,
      'email': email,
      'phonenumber': phonenumber
    };
  }
}

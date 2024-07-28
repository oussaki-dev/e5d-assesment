interface class ILoginModel {}

class LoginModel implements ILoginModel {
  String userName;
  String password;

  LoginModel({
    required this.userName,
    required this.password,
  });
}

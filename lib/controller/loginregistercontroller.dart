part of 'controller.dart';

class LoginRegisterController {
  static Future<User> register(
      String name, String email, String password) async {
    var response = await StellarisService.register(name, email, password);

    var job = json.decode(response.body);
    print(job);

    if (response.statusCode == 201 && job['message'] != null) {
      var userJson = json.encode(job['user'][0]);
      return User.fromJson(userJson);
    } else {
      return User(id: '0', name: job['error']);
    }
  }

  static Future<User> login(String email, String password) async {
    var response = await StellarisService.login(email, password);

    var job = json.decode(response.body);
    print(job);

    if (response.statusCode == 200 && job['message'] != null) {
      var userJson = json.encode(job['user']);
      return User.fromJson(userJson);
    } else {
      return User(id: '0', name: job['error']);
    }
  }

  static void navigateToMainMenu(BuildContext context, User user) {
    Navigator.pushAndRemoveUntil<dynamic>(
        context,
        MaterialPageRoute<dynamic>(builder: (context) => MainMenuPage(user)),
        (route) => false);
  }
}

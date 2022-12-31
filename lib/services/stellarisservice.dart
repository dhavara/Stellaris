part of 'services.dart';

class StellarisService {
  static Future<http.Response> register(
      String name, String email, String password) async {
    var response = await http.post(Uri.https(Const.stellarisUrl, "/api/user"),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
          'Key': 'DietaryminderKey',
        },
        body: {
          'name': name,
          'email': email,
          'password': password,
        });

    return response;
  }

  static Future<http.Response> login(String email, String password) async {
    var response = await http.post(
        Uri.https(Const.stellarisUrl, "/api/user/login"),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
          'Key': 'DietaryminderKey',
        },
        body: {
          'email': email,
          'password': password,
        });

    return response;
  }
}

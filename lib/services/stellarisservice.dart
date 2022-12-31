part of 'services.dart';

class StellarisService {
  static Future<bool> register(
      String name, String email, String password) async {
    bool isSuccess = false;

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

    print(response.body);
    Map<String, dynamic> job = json.decode(response.body);
    print(response.statusCode);
    if (response.statusCode == 201 || response.statusCode == 200) {
      if (job['message'] != null) {
        isSuccess = true;
      }
    }
    return isSuccess;
  }
}

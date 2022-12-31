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

  static Future<http.Response> getUserById(String id) async {
    Map<String, String> queryParams = {
      'id': id,
    };

    var response = await http.get(
      Uri.https(Const.stellarisUrl, "/api/user", queryParams),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
        'Key': 'DietaryminderKey',
      },
    );

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

  static Future<http.Response> createCalculationHistory(
      String userId,
      String height,
      String weight,
      String age,
      String gender,
      String activity,
      String calorie) async {
    var response = await http.post(
        Uri.https(Const.stellarisUrl, "/api/CalculateHistory"),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
          'Key': 'DietaryminderKey',
        },
        body: {
          'user_id': userId,
          'height': height,
          'weight': weight,
          'age': age,
          'gender': gender,
          'activity': activity,
          'calorie': calorie
        });

    return response;
  }
}

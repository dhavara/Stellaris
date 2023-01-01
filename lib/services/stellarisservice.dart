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

  static Future<http.Response> createCalculateHistory(
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

  static Future<List<CalculateHistory>> getCalculateHistoryByUserId(
      String userId) async {
    Map<String, String> queryParams = {
      'user_id': userId,
    };

    var response = await http.get(
      Uri.https(Const.stellarisUrl, "/api/CalculateHistory", queryParams),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
        'Key': 'DietaryminderKey',
      },
    );

    Map<String, dynamic> job = json.decode(response.body);
    print(job);
    List<CalculateHistory> result = [];
    if (response.statusCode == 200 && job['error'] == null) {
      if (job['calculation'] != null) {
        result = (job['calculation'] as List)
            .map((e) => CalculateHistory.fromMap(e))
            .toList();
      }
    }
    print(result);

    return result;
  }

  static Future<http.Response> createSchedule(
      String userId, String date) async {
    var response = await http.post(
        Uri.https(Const.stellarisUrl, "/api/Schedule"),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
          'Key': 'DietaryminderKey',
        },
        body: {
          'user_id': userId,
          'schedule_date': date,
        });

    return response;
  }

  static Future<List<Schedule>> getScheduleByUserId(String userId) async {
    Map<String, String> queryParams = {
      'user_id': userId,
    };

    var response = await http.get(
      Uri.https(Const.stellarisUrl, "/api/Schedule", queryParams),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
        'Key': 'DietaryminderKey',
      },
    );

    Map<String, dynamic> job = json.decode(response.body);
    print(job);
    List<Schedule> result = [];
    if (response.statusCode == 200 && job['error'] == null) {
      if (job['schedule'] != null) {
        result =
            (job['schedule'] as List).map((e) => Schedule.fromMap(e)).toList();
      }
    }
    print(result);

    return result;
  }

  static Future<http.Response> createScheduleItem(String scheduleId,
      String time, String foodId, String measurement, String quantity) async {
    var response = await http.post(
        Uri.https(Const.stellarisUrl, "/api/ScheduleItem"),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
          'Key': 'DietaryminderKey',
        },
        body: {
          'schedule_id': scheduleId,
          'schedule_time': time,
          'food_id': foodId,
          'measurement': measurement,
          'quantity': quantity,
        });

    return response;
  }

  static Future<List<ScheduleItem>> getScheduleItemByScheduleId(
      String scheduleId) async {
    Map<String, String> queryParams = {
      'schedule_id': scheduleId,
    };

    var response = await http.get(
      Uri.https(Const.stellarisUrl, "/api/Schedule", queryParams),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
        'Key': 'DietaryminderKey',
      },
    );

    Map<String, dynamic> job = json.decode(response.body);
    print(job);
    List<ScheduleItem> result = [];
    if (response.statusCode == 200 && job['error'] == null) {
      if (job['item'] != null) {
        result =
            (job['item'] as List).map((e) => ScheduleItem.fromMap(e)).toList();
      }
    }
    print(result);

    return result;
  }
}

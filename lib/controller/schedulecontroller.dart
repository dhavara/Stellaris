part of 'controller.dart';

class ScheduleController {
  static Future<String> createSchedule(String userId, String date) async {
    var response = await StellarisService.createSchedule(userId, date);

    var job = json.decode(response.body);

    print(job);

    String scheduleId = "";
    if ((response.statusCode == 201 && job['message'] != null) ||
        (response.statusCode == 200 && job['message'] != null)) {
      scheduleId = job['schedule']['id'];
    }

    print('Schedule ID: $scheduleId');
    return scheduleId;
  }

  static Future<dynamic> getScheduleByUserId(String userId) async {
    List<Schedule> scheduleList = [];
    await StellarisService.getScheduleByUserId(userId).then((value) {
      scheduleList = value;
    });
    return scheduleList;
  }

  static Future<dynamic> getScheduleById(String id) async {
    List<Schedule> scheduleList = [];
    await StellarisService.getScheduleById(id).then((value) {
      scheduleList = value;
    });
    return scheduleList;
  }

  static Future<bool> createScheduleItem(String scheduleId, String time,
      String foodId, String measurement, String quantity) async {
    print('Schedule ID: $scheduleId');
    var response = await StellarisService.createScheduleItem(
        scheduleId, time, foodId, measurement, quantity);

    var job = json.decode(json.encode(response.body));

    print(job);

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  static Future<dynamic> getScheduleItemByScheduleId(String scheduleId) async {
    List<ScheduleItem> itemList = [];
    await StellarisService.getScheduleItemByScheduleId(scheduleId)
        .then((value) {
      itemList = value;
    });
    return itemList;
  }
}

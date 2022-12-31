part of 'controller.dart';

class CalculateController {
  static double calculateCalories(
      String gender, int age, int height, int weight) {
    double calories = 0;

    // Untuk laki-laki: 66,5 + (13,75 x berat badan dalam kilogram) + (5,003 x tinggi badan dalam cm) – (6,75 x usia)
    // Untuk wanita: 655,1 + (9,563 x berat badan dalam kilogram) + (1,850 x tinggi badan dalam cm) – (4,676 x usia)
    if (gender == "Male") {
      calories = 66.5 + (13.75 * weight) + (5.003 * height) - (6.75 * age);
    } else if (gender == "Female") {
      calories = 655.1 + (9.563 * weight) + (1.850 * height) - (4.676 * age);
    }

    return calories;
  }

  static String getDateTime(DateTime dateTime) {
    String dateTimeString = "";

    DateTime now = DateTime.now();
    String nowString = now.toString();
    var nowSplitted = nowString.split(' ');
    var date = nowSplitted[0].split('-');
    var time = nowSplitted[1].split(':');
    print(date);
    print(time);

    for (int i = date.length - 1; i > -1; i--) {
      dateTimeString += date[i];
      if (i != 0) {
        dateTimeString += "/";
      }
    }
    dateTimeString += " ";
    for (int i = 0; i < time.length - 1; i++) {
      if (i == 0) {
        if (int.parse(time[i]) % 12 < 1) {
          dateTimeString += time[i];
        } else {
          dateTimeString += (int.parse(time[i]) - 12).toString();
        }
        dateTimeString += ":";
      } else if (i == 1) {
        dateTimeString += time[i];
        if (int.parse(time[i]) % 12 < 1) {
          dateTimeString += "AM";
        } else {
          dateTimeString += "PM";
        }
      }
    }
    return dateTimeString;
  }

  static Future<bool> createCalculateHistory(
      String userId,
      String height,
      String weight,
      String age,
      String gender,
      String activity,
      String calorie) async {
    var response = await StellarisService.createCalculationHistory(
        userId, height, weight, age, gender, activity, calorie);

    var job = json.decode(response.body);
    print(job);

    if (response.statusCode == 201 && job['message'] != null) {
      return true;
    } else {
      return false;
    }
  }
}

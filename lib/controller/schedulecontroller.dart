part of 'controller.dart';

class ScheduleController {
  static Future<dynamic> register(
      String name, String email, String password) async {
    await StellarisService.register(name, email, password);
  }
}

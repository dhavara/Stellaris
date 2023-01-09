part of 'controller.dart';

class ProfileController {
  static Future<bool> edit(String id, String name, String password) async {
    var response = await StellarisService.edit(id, name, password);

    var job = json.decode(response.body);
    print(job);

    if (response.statusCode == 200 && job['message'] != null) {
      return true;
    } else {
      return false;
    }
  }
}

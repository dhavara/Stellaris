part of 'shared.dart';

class SharedPrefs {
  static void update(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('id', id);
  }
}

part of 'controller.dart';

class LoginRegisterController {
  static Future<bool> register(
      String name, String email, String password) async {
    bool isSuccess = false;
    await StellarisService.register(name, email, password).then((value) {
      isSuccess = value;
    });
    return isSuccess;
  }



  static void navigateToMainMenu(BuildContext context) {
    Navigator.pushAndRemoveUntil<dynamic>(
          context,
          MaterialPageRoute<dynamic>(
              builder: (context) => const MainMenuPage()),
          (route) => false);
    }
  }

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Rx<String> USER_TOKEN = ''.obs;

class SessionManager {
  static final userStorage = GetStorage();
  static final String userToken = 'User Token';

  static Future<void> saveUserToken(String token) async {
    USER_TOKEN.value = token;
    userStorage.write(userToken, token);
    print("User Token Saved ==> $token.");
  }

  static Future<String> getUserToken() async {
    String token = await userStorage.read(userToken) ?? '';
    USER_TOKEN.value = token;
    print("User Token ==> $token.");
    return token;
  }
  
  static void clearSession() {
    userStorage.erase();
    USER_TOKEN.value = '';
    print("Session Cleared.");
  }
}

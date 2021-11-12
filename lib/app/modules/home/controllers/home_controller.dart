import 'package:bot_toast/bot_toast.dart';
import 'package:dna_ventures/app/local_storage/sessions.dart';
import 'package:dna_ventures/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isNotificationEnable = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void editProfile() {
    print('Profile clicked.');
  }

  void contactUs() {
    BotToast.showText(text: 'Will be updated after joining...');
  }

  void help() {
    BotToast.showText(text: 'Will be updated after joining...');
  }

  void rateApp() {
    BotToast.showText(text: 'Will be updated after joining...');
  }

  void logout() {
    SessionManager.clearSession();
    Get.offAllNamed(Routes.SPLASH);
  }
}

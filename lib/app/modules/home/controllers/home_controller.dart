import 'package:dna_ventures/app/local_storage/sessions.dart';
import 'package:dna_ventures/app/models/user_model.dart';
import 'package:dna_ventures/app/routes/app_pages.dart';
import 'package:dna_ventures/app/services/database_helper.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isNotificationEnable = true.obs;
  RxList<UserModel> usersList = <UserModel>[].obs;
  final databaseHelper = Get.find<DataBaseHelper>();

  @override
  void onInit() {
    super.onInit();
    getAllUsers();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void logout() {
    SessionManager.clearSession();
    Get.offAllNamed(Routes.SPLASH);
  }

  void getAllUsers() {
    databaseHelper.getAllUsers().then(
      (allUsers) {
        usersList.value = allUsers;
      },
    );
  }
}

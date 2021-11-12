import 'package:dna_ventures/app/modules/home/bindings/home_binding.dart';
import 'package:dna_ventures/app/modules/home/views/home_view.dart';
import 'package:dna_ventures/app/modules/login/bindings/login_binding.dart';
import 'package:dna_ventures/app/modules/login/views/login_view.dart';
import 'package:dna_ventures/app/modules/register/bindings/register_binding.dart';
import 'package:dna_ventures/app/modules/register/views/register_view.dart';
import 'package:dna_ventures/app/modules/splash/bindings/splash_binding.dart';
import 'package:dna_ventures/app/modules/splash/views/splash_view.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
  ];
}

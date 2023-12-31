import 'package:get/get.dart';
import '../presentation/btm/bottom_nav_screen.dart';
import '../presentation/home/screen/home_screen.dart';
import '../presentation/home/subs_screens/cart/cart_screen.dart';
import '../presentation/login/login_screen.dart';
import '../presentation/signup/sign_up_screen.dart';
import '../presentation/splash/splash_screen.dart';

import 'routes.dart';

class Pages {
  static var list = [
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: Routes.btmNavScreen,
      page: () => BottomNavScreen(),
    ),
    GetPage(
      name: Routes.homeScreen,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: Routes.cartScreen,
      page: () => CartScreen(),
    ),
  ];
}

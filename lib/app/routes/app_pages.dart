import 'package:get/get.dart';

import '../modules/auth/auth_binding.dart';
import '../modules/auth/auth_view.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTH;

  static final routes = [

    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
  ];
}

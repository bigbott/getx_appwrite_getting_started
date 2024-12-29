import 'package:get/get.dart';
import 'package:getx_appwrite_getting_started/app/data/appwrite_service.dart';

import 'auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(
      AuthController(appwriteService: Get.find<AppwriteService>()),
    );
  }
}

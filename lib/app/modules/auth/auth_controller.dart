import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_appwrite_getting_started/app/data/appwrite_service.dart';

class AuthController extends GetxController {
  final AppwriteService appwriteService;

  AuthController({required this.appwriteService});

  User? user;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();


  @override
  void onClose() {
    super.onClose();
    logout();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
  }

  Future<void> login() async {
    user = await appwriteService.login(
        emailController.text, passwordController.text);
    update();
  }

void  register() async {
     await appwriteService.register(
        emailController.text, passwordController.text, nameController.text);

    Get.snackbar('Success', 'User registered successfully');
    update();

  }

  Future<void> logout() async {
    appwriteService.logout();
    user = null;
    Get.snackbar('Success', 'User logged out successfully');
    update();
  }
}

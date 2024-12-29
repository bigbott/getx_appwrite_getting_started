import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_appwrite_getting_started/app/modules/auth/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<AuthController>(
              builder: (controller) => Text(
                controller.user != null 
                  ? 'Logged in as ${controller.user!.name}'
                  : 'Not logged in'
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: controller.emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: controller.passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            TextField(
              controller: controller.nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.login(),
                child: const Text('Login'),
              ),
            ),
            SizedBox(height: 30,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.register(),
                child: const Text('Register'),
              ),
            ),
            SizedBox(height: 30,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.logout(),
                child: const Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_appwrite_getting_started/app/data/appwrite_service.dart';
import 'package:getx_appwrite_getting_started/app/routes/app_pages.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppwriteService.putInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Appwrite Auth Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}

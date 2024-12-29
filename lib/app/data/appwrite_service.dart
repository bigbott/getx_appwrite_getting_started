import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:get/get.dart';
import 'package:getx_appwrite_getting_started/app/data/secret_constants.dart';

class AppwriteService extends GetxService {

  static const APPWRITE_ENDPOINT = 'https://cloud.appwrite.io/v1';

  static AppwriteService putInstance() =>
      Get.put(AppwriteService(), permanent: true);

  late final Client client;
  late final Account account;

  @override
  void onInit() {
    super.onInit();
    _initAppwrite();
  }

  void _initAppwrite() {
    client = Client()
        .setEndpoint(APPWRITE_ENDPOINT)
        .setProject(SecretConstants.APPWRITE_PROJECT_ID);  

    account = Account(client);
  }

   Future<void> register(String email, String password, String name) async {
    try {
      await account.create(
        userId: ID.unique(),
        email: email,
        password: password,
        name: name,        
      );  
    } catch (e) {
      print(e.toString());
    }
  }

 Future <User> login(String email, String password) async{
    try {
      await account.createEmailPasswordSession(
        email: email,
        password: password,
      );
     
    } catch (error, stacktrace) {
      print(error.toString());
      print(stacktrace);
    }
     return await account.get();
  }

  void logout() async{
    try {
      await account.deleteSession(sessionId: 'current');     
    } catch (e) {
      print(e.toString());
    }
  }
}

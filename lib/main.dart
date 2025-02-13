import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:immo/api/baseApi.dart';
import 'package:immo/auth/changeMotDePass.dart';
import 'package:immo/property/DetailPage.dart';
import 'package:immo/auth/signIn.dart';
import 'package:immo/storage/storageElement.dart';

import 'property/bienDici.dart';
import 'auth/signUpPage.dart';

void initialize(){
  Get.put(GetStorage());
  Get.put(StorageElement());
  Get.put(BaseApi());

}
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  initialize();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => RealEstatePage(),
        '/signup': (context) => SignUpPage(),
        '/changemotdepass': (context) => ChangePasswordPage(),
        '/signin': (context) => LoginPage(),
        '/detailpage': (context) => PropertyDetailPage(),
      },

    );
  }
}




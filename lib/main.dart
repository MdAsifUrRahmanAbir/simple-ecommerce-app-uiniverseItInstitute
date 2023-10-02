import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'routes/pages.dart';
import 'routes/routes.dart';
import 'utils/strings.dart';

void main() async{

  // initialization of get storage
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.key,
      initialRoute: Routes.splashScreen,
      getPages: Pages.list,
      builder: (context, widget) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: widget!,
        ); // Locking Device Orientation
      },
    );
  }
}

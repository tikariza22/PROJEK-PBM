import 'package:apoticare/bindings/binding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

import 'view/control_view.dart';
import 'view/loginview.dart';
import 'view/welcomeview.dart';
import 'bindings/binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => ScreenUtilInit(
        designSize: orientation == Orientation.portrait
            ? Size(375, 812)
            : Size(812, 375),
        builder: (BuildContext, child) => GetMaterialApp(
          initialBinding: Binding(),
          home: ControlView(),
          debugShowCheckedModeBanner: false,
          title: 'Apoticare',
        ),
      ),
    );
  }
}

// void main() {
//   runApp(
//     GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "Application",
//       initialRoute: Routes.WELCOME,
//       getPages: AppPages.routes,
//     ),
//   );
// }

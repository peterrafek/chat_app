import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show ScreenUtilInit;
import 'package:flutter_task/presentation/core/routes_manager/route_generator.dart';
import 'package:flutter_task/presentation/core/routes_manager/routes.dart';
import 'package:flutter_task/presentation/features/chat_screen/chat_screen.dart';
import 'package:flutter_task/presentation/features/contact_us_screen/contact_us_creen.dart';
import 'package:flutter_task/presentation/features/help_screen/help_screen.dart';

import 'presentation/features/customer_service_screen/CustomerServiceScreen.dart';

void main( ) async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) =>MaterialApp(
      debugShowCheckedModeBanner: false,

      home: child,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.customerServiceScreenRoute,
      )
    );
  }
}
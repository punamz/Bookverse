import 'package:bookverse/core/constant.dart';
import 'package:bookverse/core/global_binding.dart';
import 'package:bookverse/core/router_configs.dart';
import 'package:bookverse/src/infrastructure/local_database/local_database.dart';
import 'package:bookverse/src/presentation/view/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Storage.getInstance(storeName: Constant.appName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bookverse',
      theme: ThemeData(colorSchemeSeed: Colors.blue, useMaterial3: true),
      enableLog: false,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeView.routeName,
      getPages: RouterConfigs.routes,
      initialBinding: GlobalBinding(),
    );
  }
}

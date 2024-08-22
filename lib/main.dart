import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'View/detail_screen.dart';
import 'View/home_screen.dart';
import 'View/splash_screen.dart';

void main()
{
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () => const SplashScreen()),
        GetPage(name: '/', page: () => const HomeScreen()),
        GetPage(name: '/detail', page: () => const DetailScreen()),
      ],
    );
  }
}
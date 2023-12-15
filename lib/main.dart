
import 'package:bottam/Screen/homescreen.dart';
import 'package:bottam/Screen/splashscreen.dart';
import 'package:bottam/assistant/Panda/panda_security.dart';
import 'package:bottam/assistant/Panda/pandabear.dart';
import 'package:bottam/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/app_constant.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref=await SharedPreferences.getInstance();
  UserId=pref.getString("UserId") ?? "";
  isLogin=pref.getBool("isLogin") ?? false;
  print(UserId);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomThemeData.darkTheme,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home:  const SplashScreen(),
    );
  }
}
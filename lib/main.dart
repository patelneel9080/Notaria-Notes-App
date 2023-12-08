
import 'package:bottam/Screen/homescreen.dart';
import 'package:bottam/Screen/welcomescreen.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Pages/assistantpage.dart';
import 'assistant/Icebear/badreview.dart';
import 'Pages/firstpage.dart';
import 'assistant/Icebea'
    'r/icebear.dart';
import 'config/app_constant.dart';
import 'Tests/testone.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref=await SharedPreferences.getInstance();
  UserId =pref.getString("UserId") ?? "";
  print("UserId:$UserId");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: Colors.white)),
      ),
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}
import 'package:bottam/Images/images.dart';
import 'package:bottam/Pages/firstpage.dart';
import 'package:bottam/assistant/Icebear/icebear.dart';
import 'package:bottam/config/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Pages/assistantpage.dart';
import '../Pages/dailyquotes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text("NOTARIA"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DailyQuotes(),
                    ));
              },
              icon: const Icon(CupertinoIcons.smiley))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.deepPurpleAccent,
              ),
                child: Text(
              "$UserId",
              style: const TextStyle(color: Colors.white, fontSize: 24),
            )),
            ListTile(
              leading: const Icon(Icons.assistant),
            title: const Text("Assistant",style: TextStyle(color:Color(0xff898989),fontWeight: FontWeight.w600),),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AssistantPage(),));
            },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text("Log Out",style: TextStyle(color:Color(0xff898989),fontWeight: FontWeight.w600),),
            onTap: () {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const FirstPage(),));
              });
            },
            )
          ],
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AssistantPage(),
                    ));
              },
              child: Container(
                height: size.height / 8,
                width: size.width / 1.1,
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Your Assistants",
                          style: GoogleFonts.aboreto(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

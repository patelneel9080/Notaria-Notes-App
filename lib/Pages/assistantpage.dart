import 'package:bottam/Images/images.dart';
import 'package:bottam/assistant/Icebear/icebear.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class AssistantPage extends StatefulWidget {
  const AssistantPage({super.key});

  @override
  State<AssistantPage> createState() => _AssistantPageState();
}

class _AssistantPageState extends State<AssistantPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.back),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    height: size.height/2.5,
                    width: size.width/2.2,
                    margin: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(WelcomeBkg.grizzassistant),fit: BoxFit.cover),
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Grizzly",style: GoogleFonts.staatliches(color: Colors.deepOrangeAccent,fontSize: 28),)
                      ],
                    ),
                  ),
                  Container(
                    height: size.height/2.5,
                    width: size.width/2.2,
                    margin: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(WelcomeBkg.pandaassistant),fit: BoxFit.cover),
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Panda",style: GoogleFonts.staatliches(color: Colors.yellowAccent,fontSize: 28),)
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage(),));
                    },
                    child: Container(
                      height: size.height/2.5,
                      width: size.width/2.2,
                      margin: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage(WelcomeBkg.icebearassistant),fit: BoxFit.cover),
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("IceBear",style: GoogleFonts.staatliches(color: Colors.teal,fontSize: 28),)
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
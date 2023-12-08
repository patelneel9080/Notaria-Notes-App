import 'package:bottam/Images/images.dart';
import 'package:bottam/config/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'badreview.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String getMessage() {
    var hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return 'Good Morning $UserId !!';
    } else if (hour >= 12 && hour < 17) {
      return 'Good Afternoon $UserId !!';
    } else if (hour >= 17 && hour < 20) {
      return 'Good Evening $UserId !!';
    } else {
      return 'Good Night $UserId !!';
    }
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(CupertinoIcons.back),
      ),),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(image: NetworkImage(BackgroundImg2.icebear),fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height/8,),
            Text(
              getMessage(),
              style: const TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("How's ur day today??",style: TextStyle(color: Colors.white),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: (){}, child: Text("Good")),
                TextButton(onPressed: (){}, child: Text("Average")),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BadReview(),));
                }, child: Text("Bad")),
              ],
            )
          ],
        ),
      ),
    );
  }
}

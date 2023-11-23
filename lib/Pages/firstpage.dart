import 'package:bottam/Images/images.dart';
import 'package:bottam/config/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Screen/welcomescreen.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  TextEditingController _UserId = TextEditingController();
  String _error = '';
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                image: NetworkImage(BackgroundImg.krishnaimg),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: size.height / 6,
              width: size.width,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.6),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: size.height / 14,
                        width: size.width / 1.3,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: TextField(
                          onTap: () {},
                          cursorColor: Colors.black54,
                          controller: _UserId,
                          style: const TextStyle(fontWeight: FontWeight.w400),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: "Name",
                              enabledBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              labelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              hintText: 'Type your name',
                              focusedBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(24),
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              hintStyle: const TextStyle(
                                  fontSize: 16, color: Colors.black54),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 10.0),
                              prefixIcon: const Icon(
                                CupertinoIcons.profile_circled,
                                color: Colors.black,
                                size: 26,
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Container(
                        height: size.height / 14,
                        width: size.width / 6.5,

                        child: ElevatedButton(
                          style: ButtonStyle(
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(36)))
                          ),
                          onPressed: () async {
                            if (_UserId.text.isEmpty) {
                              setState(() {
                                _error = 'Please Enter Ur Name';
                              });
                            } else {
                              _error = "";
                              isCheck=true;
                              setState(() {});
                              SharedPreferences pref =
                                  await SharedPreferences.getInstance();
                              pref.setString("UserId", _UserId.text);
                              UserId = pref.getString("UserId")!;
                              Future.delayed(const Duration(seconds: 3), () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const WelcomeScreen(),
                                    ));
                              });
                            }
                          },
                          child: (!isCheck)
                              ? const Icon(
                                  CupertinoIcons.arrow_right,
                                  color: Colors.black,
                                )
                              : const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      )
                    ],
                  ),
                  if (_error.isNotEmpty)
                    Text(
                      _error,
                      style: const TextStyle(color: Colors.red),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

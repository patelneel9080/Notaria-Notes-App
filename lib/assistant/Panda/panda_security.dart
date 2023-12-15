import 'dart:ui';

import 'package:bottam/Images/images.dart';
import 'package:bottam/assistant/Panda/pandabear.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PandaSecurity extends StatefulWidget {
  const PandaSecurity({super.key});

  @override
  State<PandaSecurity> createState() => _PandaSecurityState();
}

class _PandaSecurityState extends State<PandaSecurity> {
  String _errorMessage = '';
  TextEditingController _userPassword = TextEditingController();
   @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(BackgroundImg2.pandabkg), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height/14,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: size.height / 14,
                  width: size.width / 1.3,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: TextField(
                    enabled: true,
                    controller: _userPassword,
                    onTap: () {},
                    cursorColor: Colors.black,
                    autocorrect: true,
                    obscureText: true,
                    decoration:  InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                        const BorderSide(color: Colors.transparent),
                      ),
                      hintText: 'Enter password',
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide:
                        const BorderSide(color: Colors.transparent),
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
                Container(
                  height: size.height / 14,
                  width: size.width / 6.5,
                  child: ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),
                        alignment: Alignment.center,
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(36)))),
                    onPressed: ()  {
                      String password = _userPassword.text;

                      // Here you can add your logical part for authentication
                      if (password.isEmpty) {
                        setState(() {
                          _errorMessage = "Please enter password";
                        });
                      } else {
                        if (password == 'admin123') {
                          // Navigate to the home page
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                const PandaPage(),
                              ));
                        }
                        else {
                          setState(() {
                            _errorMessage = "Invalid password";
                          });
                        }
                      }
                    },
                    child: const Icon(
                      CupertinoIcons.arrow_right,
                      color: Colors.white,
                    )

                  ),
                )
              ],
            ),
            if (_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}

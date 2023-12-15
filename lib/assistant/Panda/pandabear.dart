import 'package:bottam/Images/images.dart';
import 'package:flutter/material.dart';

class PandaPage extends StatefulWidget {
  const PandaPage({super.key});

  @override
  State<PandaPage> createState() => _PandaPageState();
}

class _PandaPageState extends State<PandaPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(BackgroundImg2.panda),fit: BoxFit.cover)
        ),
      ),
    );
  }
}

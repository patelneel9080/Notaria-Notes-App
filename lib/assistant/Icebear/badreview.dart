import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Images/images.dart';

class BadReview extends StatefulWidget {
  @override
  _BadReviewState createState() => _BadReviewState();
}

class _BadReviewState extends State<BadReview> {
  List<String> quotes = [
    "Change me!",
    "Your smile can make someone else's day better. Share it generously.",
    "Today is a gift. Embrace it, enjoy it, and make it unforgettable.",
    "Every day is a new beginning. Take a deep breath and start afresh.",
    "You are capable of amazing things. Believe in yourself and make today count.",
    "Believe in your abilities; you are stronger than you think.",
    // Add more quotes as needed
  ];

  String currentQuote = "Okay so now i try to change ur mood\n(please wait for 30 second)"; // Initial quote
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Set up a timer to change the quote every 5 seconds
    _timer = Timer.periodic(const Duration(seconds: 30), (Timer timer) {
      changeQuote();
    });
  }

  void changeQuote() {
    setState(() {
      // Randomly pick a quote from the list
      currentQuote = quotes[Random().nextInt(quotes.length)];
    });
  }

  @override
  void dispose() {
    // Cancel the timer to avoid memory leaks
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
            child: const Icon(
          CupertinoIcons.back,
          color: Colors.white,
        )),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(BackgroundImg2.icebear), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              textAlign: TextAlign.center,
              "So here's some quotes for u\n(Every 30 seconds it changed)",
              style: TextStyle(color: Colors.white,fontSize: 12),
            ),
            SizedBox(
              height: size.height / 6,
            ),
            Text(
              textAlign: TextAlign.center,
              currentQuote,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

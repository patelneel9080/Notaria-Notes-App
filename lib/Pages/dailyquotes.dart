import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Images/images.dart';

class DailyQuotes extends StatefulWidget {
  @override
  _DailyQuotesState createState() => _DailyQuotesState();
}

class _DailyQuotesState extends State<DailyQuotes> {
  List<String> quotes = [
    "Every day may not be good, but there's something good in every day.",

    "Your attitude determines your direction.",

    "Today is a new day, and it's yours to shape. Own it!",

    "The sun is a daily reminder that we too can rise again from the darkness, that we too can shine our own light.",

    "Seize the day, embrace the present, and make it beautiful.",

    "Don't count the days; make the days count.",

    "Every morning brings new potential, but only if you make the most of it. You can't use up yesterday's hours on today's clock.",

    "Smile at the obstacle, for it is a bridge.",

    "Each morning we are born again. What we do today matters most.",

    "Today's accomplishments were yesterday's impossibilities.",

    "The best way to predict the future is to create it.",

    "Your energy introduces you before you even speak.",

    "Today is a gift, that's why it's called the present.",

    "Don't wait for the perfect moment, take the moment and make it perfect.",

    "You have within you right now, everything you need to deal with whatever the world can throw at you.",

    "The only limit to our realization of tomorrow will be our doubts of today.",

    "Life is 10% what happens to us and 90% how we react to it.",

    "The more you praise and celebrate your life, the more there is in life to celebrate.",

    "Your life does not get better by chance, it gets better by change.",

    "You are never too old to set another goal or to dream a new dream.",

    "Do not wait to strike till the iron is hot, but make it hot by striking.",

    "The only way to do great work is to love what you do.",

    "In every day, there are 1,440 minutes. That means we have 1,440 daily opportunities to make a positive impact.",

    "Difficulties in life are intended to make us better, not bitter.",

    "Believe you can and you're halfway there.",

    "Happiness is not something ready-made. It comes from your own actions.",

    "Your vibe attracts your tribe.",

    "Be the reason someone smiles today.",

    "The secret of getting ahead is getting started.",

    "Surround yourself with those who only lift you higher.",

    "You are the sky. Everything else is just the weather.",

    "The best way to predict your future is to create it.",

    "Every morning brings new potential, but only if you start it right.",

    "Success is not final, failure is not fatal: It is the courage to continue that counts.",

    "You are stronger than you think.",
    // Add more quotes as needed
  ];

  String currentQuote = ""; // Initial quote
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    // Randomly select an initial quote when the app starts
    changeQuote();

    // Schedule the auto quote change after 5 seconds (adjust the duration as needed)
    Timer.periodic(const Duration(hours: 22), (timer) {
      changeQuote();
    });
  }

  void changeQuote() {
    // Randomly select a quote from the list
    Random random = Random();
    int index = random.nextInt(quotes.length);

    setState(() {
      currentQuote = quotes[index];
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
      backgroundColor: const Color(0xffECC1CD),
      appBar: AppBar(
        backgroundColor: const Color(0xffECC1CD),
        elevation: 0,
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
              image: AssetImage(AssetsImg.trio1), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              textAlign: TextAlign.center,
              "(Daily Quote - Every times it changed when u come back)",
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
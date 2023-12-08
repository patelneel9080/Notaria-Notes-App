
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../model/onboarding.dart';
import 'homescreen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int activeIndex = 0;
  PageController controller = PageController(
    initialPage: 0,
    viewportFraction: 1,
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView.builder(
            controller: controller,
            physics: const PageScrollPhysics(),
            onPageChanged: (val) {
              activeIndex = val;
              setState(() {});
            },
            itemCount: onBoardingScreen.length,
            itemBuilder: (BuildContext context, int index) {
              return PageViewContainer(
                image: onBoardingScreen[index].image,
                title: onBoardingScreen[index].title,
                subTitle: onBoardingScreen[index].subTitle,
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomePage(),));
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(
                        fontFamily: "Gilroy-Regular",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white54,
                        height: 28 / 18,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  AnimatedSmoothIndicator(
                    activeIndex: activeIndex,
                    count: onBoardingScreen.length,
                    axisDirection: Axis.horizontal,
                    effect: const WormEffect(
                      dotColor: Colors.grey,
                      activeDotColor: Colors.blue,
                      spacing: 3,
                      dotHeight: 7,
                      dotWidth: 7,
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {

                      if(controller.initialPage == 1){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                      }else{
                        controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.linear);
                      }
                    },
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        fontFamily: "Gilroy-Regular",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellowAccent,
                        height: 28 / 18,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PageViewContainer extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;

  const PageViewContainer(
      {super.key,
        required this.image,
        required this.title,
        required this.subTitle});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(1),
        image: DecorationImage(image: NetworkImage(image),opacity: .5,fit: BoxFit.cover),
      ),
      child: Column(

        children: [
          SizedBox(
            height: size.height/2,
          ),
          Text(
            title,
            maxLines: 2,
            style: const TextStyle(
              fontFamily: "Gilroy-Bold",
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: size.height/43,
          ),
          SizedBox(
            width: size.width - 190,
            child: Text(
              subTitle,
              maxLines: 2,
              style: const TextStyle(
                fontFamily: "DM Sans",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
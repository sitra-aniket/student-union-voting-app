import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'intro_page1.dart';
import 'intro_page2.dart';
import 'intro_page3.dart';
import '../components/button.dart';
import '../pages/auth_page.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  //controller to keep track of which page we are on
  PageController controller = PageController();
  // keep track of if we are on last page or not
  bool onLastPage = false;
  bool showGetStartedButton = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.page == 2) {
        Future.delayed(Duration(milliseconds: 5), () {
          if (mounted) {
            setState(() {
              showGetStartedButton = true;
            });
          }
        });
      } else {
        setState(() {
          showGetStartedButton = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // PageView
          PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),

          // Indicator
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Visibility(
              visible: !onLastPage, // Show on all pages except the last one
              child: Container(
                alignment: Alignment.center,
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 3, // Change count to 3 for three pages
                ),
              ),
            ),
          ),

          // Get Started Button
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Visibility(
              visible: showGetStartedButton, // Show only on last page after delay
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AuthPage(),
                      ),
                    );
                  },
                  child: GetStartedButton(text: "Get Started"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

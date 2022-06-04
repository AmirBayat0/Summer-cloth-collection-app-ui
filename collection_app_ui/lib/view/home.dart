import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../data/dummy_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  /////////////////////////////////////
  //@CodeWithFlexz on Instagram
  //
  //AmirBayat0 on Github
  //Programming with Flexz on Youtube
  /////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.only(left: 15, top: 20, right: 15),
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Collection",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.grey.shade500,
                            fontFamily: 'Lato'),
                      ),
                      const Text(
                        "Summer 2022",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lato'),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          pageindicator(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (currentIndex < listOfPic.length - 1) {
                                  pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.ease);
                                } else {
                                  currentIndex = 0;
                                  pageController.animateToPage(currentIndex,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.ease);
                                }
                              });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
            Expanded(
              flex: 3,
              child: SizedBox(
                width: size.width,
                height: double.infinity,
                child: PageView.builder(
                    itemCount: listOfPic.length,
                    physics: const BouncingScrollPhysics(),
                    controller: pageController,
                    onPageChanged: (newPage) {
                      setState(() {
                        currentIndex = newPage;
                      });
                    },
                    itemBuilder: (ctx, index) {
                      return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(listOfPic[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  /// Smooth Page Indicator Widget
  SmoothPageIndicator pageindicator() {
    return SmoothPageIndicator(
      controller: pageController,
      count: listOfPic.length,
      effect: const ExpandingDotsEffect(
          spacing: 4.0,
          radius: 10.0,
          dotWidth: 18.0,
          dotHeight: 10.0,
          expansionFactor: 3.8,
          dotColor: Colors.grey,
          activeDotColor: Colors.black),
      onDotClicked: (newIndex) {
        setState(() {
          pageController.animateToPage(newIndex,
              duration: const Duration(milliseconds: 500), curve: Curves.ease);
        });
      },
    );
  }
}

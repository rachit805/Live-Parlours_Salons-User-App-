

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'BHLoginScreen.dart';
    class WelcomeScreen extends StatefulWidget {
      @override
      _WelcomeScreenState createState() => _WelcomeScreenState();
    }

    class _WelcomeScreenState extends State<WelcomeScreen> {

    var pages= [
      PageViewModel(

        title: "Find NearBy Salons",
        body: "Choose your hair style choose your hair style choose your hair style...",
        image: Center(
            child: Image.asset("images/hairSalon/bh_walkThroughImg1.jpg",
              )

        ),
        decoration: const PageDecoration(
          pageColor: Colors.white,
        ),
      ),
      PageViewModel(
         title: "Attractive Promotions",
         body: "Choose your hair style choose your hair style choose your hair style...",
         image: Center(child: Image.asset("images/hairSalon/bh_walkThroughImg2.jpg", height: 300.0)),
         decoration: const PageDecoration(
         pageColor: Colors.white,
    ),
    ),

    ];


      @override
      Widget build(BuildContext context) {
        return Scaffold(
          body: IntroductionScreen(
            pages: pages,
            onDone: () {
              // When done button is press
            Navigator.pushReplacement(
              context, MaterialPageRoute(
              builder: (context) => BHLoginScreen()
            )
            );

            },
            onSkip: () {
              // You can also override onSkip callback
              Navigator.pushReplacement(
                  context, MaterialPageRoute(
                  builder: (context) => BHLoginScreen()
              ),
              );
            },

            showNextButton: true,
            showSkipButton: true,
            skip: const Text("Skip", style: TextStyle(fontWeight: FontWeight.w600),),
            next: const Text("Next", style: TextStyle(fontWeight: FontWeight.w600),),
            done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600),),
            dotsDecorator: DotsDecorator(
                size: const Size.square(10.0),
                activeSize: const Size(20.0, 10.0),
                activeColor: Colors.orangeAccent,
                color: Colors.black26,
                spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)
                )
            ),
          ),

        );
      }


    }

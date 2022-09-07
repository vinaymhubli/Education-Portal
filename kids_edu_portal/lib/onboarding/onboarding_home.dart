import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:kids_edu_portal/splashscreen/splash_screens.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardHome extends StatefulWidget {
  OnBoardHome({Key? key}) : super(key: key);

  @override
  State<OnBoardHome> createState() => _OnBoardHomeState();
}

class _OnBoardHomeState extends State<OnBoardHome> {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
          image: Image.network(
              "https://cdn.dribbble.com/users/291221/screenshots/1425333/helper.gif"),
          title: " Welcome Developers",
          body:
              "Dubai based app development company boostmysites has been named the best app developer in the region for the year 2020. The company which recently announced the plans for their expansion from their current markets, has seen exponential…,",
          footer: Text("@boostmysites.com",
              style: TextStyle(fontWeight: FontWeight.bold)),
          decoration: PageDecoration(
              bodyTextStyle: TextStyle(fontSize: 15),
              bodyAlignment: Alignment.center)),
      PageViewModel(
          image: Image.network(
              "https://media3.giphy.com/media/8FzZujKg1TwkG66FRY/giphy.gif?cid=ecf05e47c5cujsfj0yqdxwolta93z2rfmyy4b09owfzs3wak&rid=giphy.gif&ct=g",
              fit: BoxFit.fitWidth),
          title: "OUR  VISION",
          body:
              "Boostmysites.com has come up with very successful strategies for SEO and app development services and has gained attention of angel investors who are investing 10 million dollars to collaborate with the company’s global..",
          footer: Text(
            "@boostmysites.com",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          decoration: PageDecoration(
              bodyTextStyle: TextStyle(fontSize: 15),
              bodyAlignment: Alignment.center)),
      PageViewModel(
          image: Image.network(
            "https://st1.latestly.com/wp-content/uploads/2020/07/IMG-20200713-WA0019.jpg",
            width: 320,
            height: 400,
          ),
          title: "we provide",
          body:
              "# Online Pre-recorded sessio\n # 100+ hours of content\n # 2 hrs of Doubt Clearing session with the Senior App Developer\n# One on One sessions for each student on weekly basis until they get job\n # Complimentary offline sessions (according to Covid regulations)",
          decoration: PageDecoration(
              pageColor: Colors.white,
              bodyTextStyle: TextStyle(fontSize: 15),
              bodyAlignment: Alignment.center),
          footer: Text(
            "Develped by boostmysites student vinay",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
      PageViewModel(
        image: Image.asset("assets/ceo.jpeg"),
        title: "CEO TALK",
        body:
            "* Best contents made in form of videos\n * assignments and live sessions\n * Regularly updated until latest version.\n  * Are you one among them?",
        decoration: PageDecoration(
            pageColor: Colors.white,
            bodyTextStyle: TextStyle(fontSize: 15),
            bodyAlignment: Alignment.center),
        footer: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => SplashScreen()));
            },
            child: Text(
              "Click to continue",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)))),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white30,
              statusBarIconBrightness: Brightness.light)),
      body: IntroductionScreen(
        done: Text("Register",
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold)),
        onDone: () {},
        pages: getPages(),
        showNextButton: true,
        showBackButton: true,
        next: Text("Next", style: TextStyle(color: Colors.black)),
        back: Text("Back", style: TextStyle(color: Colors.black)),
        globalBackgroundColor: Colors.white,
      ),
    );
  }
}

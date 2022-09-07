

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kids_edu_portal/screen/nextpage.dart';

class KidsHome extends StatefulWidget {
  KidsHome({Key? key}) : super(key: key);

  @override
  State<KidsHome> createState() => _KidsHomeState();
}

class _KidsHomeState extends State<KidsHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            centerTitle: true,
            title: Text(
              "BoostMySites",
              style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 85, 36, 148),
                  fontWeight: FontWeight.bold),
            ),
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor:
                    Color.fromARGB(255, 85, 36, 148).withOpacity(0.9),
                statusBarIconBrightness: Brightness.light)),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/vp.png"),
                        fit: BoxFit.contain)),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Distant Learning  Made Easy",
                        style: TextStyle(
                            color: Color.fromARGB(249, 123, 28, 167))),
                    Text(
                      "BE THE BEST APP DEVELOPER",
                      style: TextStyle(
                          color: Color.fromARGB(249, 123, 28, 167),
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "* 10th & 12th grade students,\n  * Dropouts,\n  * Engineers, \n  * Marketing & Sales Professionals, \n * Freshers,\n or anyone who is willing to learn this new skill",
                      style:
                          TextStyle(color: Color.fromARGB(249, 123, 28, 167)),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 15,
                              color: Color.fromARGB(255, 85, 36, 148)
                                  .withOpacity(0.1)),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 111, 62, 167)),
                          child: IconButton(
                              onPressed: openNextPage,
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
 void openNextPage() {
  Navigator.push(context, 
   PageRouteBuilder(
    transitionDuration:Duration(seconds: 1),
    transitionsBuilder: (context,animation,animationTime,child){
      return ScaleTransition(scale: animation,child: child);
    },
    pageBuilder: (context, animation, secondaryAnimation) {
      return NextPage();
    }));
   

}}
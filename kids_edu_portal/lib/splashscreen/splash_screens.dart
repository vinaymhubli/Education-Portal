import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kids_edu_portal/screen/kidshome.dart';
import 'package:lottie/lottie.dart';


class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5),
    (){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>KidsHome()));
    }
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
         systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.light
          )
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/bms.png",scale: 1.2,),
            SizedBox(height: 25,),
            Lottie.asset("assets/loading.json",height: 85)
          ],
        ),
      )
      
    );
  }
}
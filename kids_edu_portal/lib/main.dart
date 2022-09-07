import 'package:flutter/material.dart';
import 'package:kids_edu_portal/onboarding/onboarding_home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'splashscreen/splash_screens.dart';

 int? initScreen;
Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 SharedPreferences preferences= await SharedPreferences.getInstance();
 initScreen= (await preferences.getInt('initScreen'));
 await preferences.setInt('initScreen',1);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BOOSTMYSITES ONLINE EDUCATION',
      debugShowCheckedModeBanner: false,
      initialRoute: initScreen==0|| initScreen==null? 'onboard':'home',
      routes: {
        'home':(context) => SplashScreen(),
        'onboard':(context) => OnBoardHome()
      },  
       
    );
  }
    }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kids_edu_portal/model/seperatefile.dart';
import 'seperatefile.dart';

const email = "vinaym1815@gmail.com";
const watsapp = "8317408836";
const location = "Hubli,Karnataka, India";

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            " Developed By",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor:
                    Colors.transparent,
                statusBarIconBrightness: Brightness.dark),
        ),
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.lightBlueAccent,
        body: SafeArea(
          minimum: const EdgeInsets.only(top: 100),
          child: Column(
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/vin.jpeg'),
              ),
              Text(
                "Vinay M",
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Flutter Developer",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
                width: 200,
                child: Divider(
                  color: Colors.white,
                ),
              ),
              InfoCard(
                  text: watsapp,
                  icon: Icons.chat_sharp,
                  onPressed: () async {}),
              InfoCard(
                  text: location,
                  icon: Icons.location_city,
                  onPressed: () async {}),
              InfoCard(text: email, icon: Icons.email, onPressed: () async {}),
            ],
          ),
        ));
  }
}

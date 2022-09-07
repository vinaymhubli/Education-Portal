import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class MentorWatsapp extends StatefulWidget {
  MentorWatsapp({Key? key}) : super(key: key);

  @override
  State<MentorWatsapp> createState() => _MentorWatsappState();
}

class _MentorWatsappState extends State<MentorWatsapp> {
  final Uri _url = Uri.parse('https://boostmysites.com');
  Future<void> _launchUrl() async {
    
  if (!await launchUrl(_url)) {
    
    throw 'Could not launch $_url';
  }
}
  openwhatsapp() async {
    var whatsapp = "+919790035747";
    var whatsappURl_android =
        "whatsapp://send?phone=" + whatsapp + "&text=hello reshab sir";
    var whatappURL_ios =
        "https://wa.me/$whatsapp?text=${Uri.parse("hello reshab sir")}";
    if (Platform.isAndroid) {
      if (await canLaunch(whatsappURl_android)) {
        await launch(whatsappURl_android, forceSafariVC: false);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
      }
    } else {
      if (await canLaunch(whatsappURl_android)) {
        await launch(whatsappURl_android);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Text('Book your appointment',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'interested candidates can book your slots for appointment by pinging me in whatsapp by clicking the link below.....',
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 200,
              width: 200,
              child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/whatsappimage.jpeg')),
            ),
            SizedBox(height: 20),
            Container(
              child: RaisedButton(
                onPressed: () {
                  openwhatsapp();
                },
                color: Color(0xff075E54),
                child: Text(
                  'Continue to Chat',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              ),
            ),
            Divider(indent: 40.0, endIndent: 40.0, color: Colors.teal),
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('For more details-',style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(width: 5.0,),
                  InkWell(onTap:(){
                    _launchUrl();
                  }

                  ,
                    child: Text('www.boostmysites.com',style: TextStyle(color: Colors.grey,decoration: TextDecoration.underline),))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

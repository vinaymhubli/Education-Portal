import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kids_edu_portal/pages/female_teacherpage.dart';
import 'package:kids_edu_portal/pages/placement_officerpage.dart';
import 'package:kids_edu_portal/model/profile.dart';
import 'package:kids_edu_portal/screen/alert_dialog.dart';
import 'package:kids_edu_portal/screen/kidshome.dart';
import '../pages/mentorpage.dart';

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      routes: {
        '/TeacherPage': (context) => const TeacherPage(),
        '/FemaleTeacherPage': (context) => FemaleTeacherPage(),
        '/PlacementOfficerPage': (context) => const PlacementOfficerPage()
      },
    );
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
                onPressed: () {
                  
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                ));
          }),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications_on_sharp),
              color: Colors.black,
              onPressed: ()=>showAlertDialog(context, "Notification", "No Notification Yet"),
              iconSize: 30,
            )
          ],
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white30,
              statusBarIconBrightness: Brightness.dark)),
      drawer: Drawer(
          child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("User"),
            accountEmail: Text("User@gmail.com"),
            decoration: BoxDecoration(
              color: Colors.lightBlue.withOpacity(0.5),
            ),
            currentAccountPicture: CircleAvatar(
                radius: 40.0, backgroundColor: Colors.black, child: Text("VM")),
          ),
          ListTile(
            title: Text("Home"),
            trailing: Icon(Icons.home_outlined),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => KidsHome())),
          ),
          Divider(),
          ListTile(
            title: Text("Profile"),
            trailing: Icon(Icons.portrait_outlined),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Profile())),
          ),
          ListTile(
            title: Text("Close"),
            trailing: Icon(Icons.close_sharp),
            onTap: () => Navigator.of(context).pop(),
          ),
        ],
      )),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage("assets/searchBg.png"))),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello!",
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(" BoostMySites\n  App Developers",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 28,
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
                  padding: EdgeInsets.all(30),
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey.shade100,
                  child: Column(children: [
                    Row(
                      children: [
                        Text(
                          "Our Team",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                              color: Colors.black),
                        )
                      ],
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                      child: Column(children: [
                        tutorWidget(
                            "boy1", "Mr Reshab.R", "CEO", "9-10", "49999"),
                        femaletutorWidget("girl", "Miss senorita",
                            "Communication Skill", "9-10", "49999"),
                        PlacementtutorWidget("boy2", "Mr Rohith K",
                            "Placement Assistance", "9-10", "49999")
                      ]),
                    ))
                  ])))
        ],
      ),
    );
  }

  InkWell tutorWidget(
      String img, String name, String subj, String grade, String price) {
    return InkWell(
      onTap: openTeacherPage,
      child: Container(
        margin: EdgeInsets.only(top: 20),
        height: 130,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: Colors.lightBlue.withOpacity(0.5)),
        child: Row(
          children: [
            Container(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(30)),
                    child: Container(
                      height: 125,
                      width: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/iconBgNew.png'),
                              fit: BoxFit.contain)),
                    ),
                  ),
                  Container(
                    height: 130,
                    padding: EdgeInsets.only(left: 5, top: 5),
                    child: Stack(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          child: RotatedBox(
                            quarterTurns: 2,
                            child: Icon(
                              Icons.star,
                              color: Colors.yellow.shade700,
                              size: 60,
                            ),
                          ),
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          child: Center(
                            child: Text(
                              "5",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.brown),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    left: 50,
                    child: Hero(
                      tag: img,
                      child: Container(
                        width: 100,
                        height: 130,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/$img.png"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      name,
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      '$subj ',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  InkWell femaletutorWidget(
      String img, String name, String subj, String grade, String price) {
    return InkWell(
      onTap: openFemaleTeacherpage,
      child: Container(
        margin: EdgeInsets.only(top: 20),
        height: 130,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: Colors.lightBlue.withOpacity(0.5)),
        child: Row(
          children: [
            Container(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(30)),
                    child: Container(
                      height: 125,
                      width: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/iconBgNew.png'),
                              fit: BoxFit.contain)),
                    ),
                  ),
                  Container(
                    height: 130,
                    padding: EdgeInsets.only(left: 5, top: 5),
                    child: Stack(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          child: RotatedBox(
                            quarterTurns: 2,
                            child: Icon(
                              Icons.star,
                              color: Colors.yellow.shade700,
                              size: 60,
                            ),
                          ),
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          child: Center(
                            child: Text(
                              "5",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.brown),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    left: 50,
                    child: Hero(
                      tag: img,
                      child: Container(
                        width: 100,
                        height: 130,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/$img.png"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      name,
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      '$subj ',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void openTeacherPage() {
    Navigator.pushNamed(context, '/TeacherPage');
  }

  void openProfilepage() {
    Navigator.pushNamed(context, '/ProfilePage');
  }

  void openFemaleTeacherpage() {
    Navigator.pushNamed(context, '/FemaleTeacherPage');
  }

  void openPlacementofficerpage() {
    Navigator.pushNamed(context, '/PlacementOfficerPage');
  }

  InkWell PlacementtutorWidget(
      String img, String name, String subj, String grade, String price) {
    return InkWell(
      onTap: openPlacementofficerpage,
      child: Container(
        margin: EdgeInsets.only(top: 20),
        height: 130,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: Colors.lightBlue.withOpacity(0.5)),
        child: Row(
          children: [
            Container(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(30)),
                    child: Container(
                      height: 125,
                      width: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/iconBgNew.png'),
                              fit: BoxFit.contain)),
                    ),
                  ),
                  Container(
                    height: 130,
                    padding: EdgeInsets.only(left: 5, top: 5),
                    child: Stack(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          child: RotatedBox(
                            quarterTurns: 2,
                            child: Icon(
                              Icons.star,
                              color: Colors.yellow.shade700,
                              size: 60,
                            ),
                          ),
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          child: Center(
                            child: Text(
                              "5",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.brown),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    left: 50,
                    child: Hero(
                      tag: img,
                      child: Container(
                        width: 100,
                        height: 130,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/$img.png"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      name,
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      '$subj ',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

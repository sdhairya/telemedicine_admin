import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:telemedicine_admin/addDoctors/addDoctors.dart';
import 'package:telemedicine_admin/addHospital/addHospital.dart';
import 'package:telemedicine_admin/colors.dart';
import 'package:telemedicine_admin/components.dart';
import 'package:telemedicine_admin/dataClass/dataClass.dart';
import 'package:telemedicine_admin/loginScreen/loginScreen.dart';
import 'package:telemedicine_admin/viewDoctors/viewDoctors.dart';
import 'package:telemedicine_admin/viewPatients/viewPatients.dart';

import '../api.dart';

// import '../editProfile/editProfile.dart';
// import '../profileScreen/profileScreen.dart';

class body extends StatefulWidget {
  final String id;
  const body({Key? key, required this.id}) : super(key: key);

  @override
  State<body> createState() => _bodyState();
}

class _bodyState extends State<body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/adminDashboard.jpg"),fit: BoxFit.fill),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Container(
                    margin: EdgeInsets.only(left: 20),
                    alignment: Alignment.bottomLeft,
                    width: double.infinity,
                    child: Wrap(
                      direction: Axis.vertical,
                      children: [
                        components().text("Welcome !", FontWeight.w700, Colors.white, 38),
                        components().text("Admin", FontWeight.w700, Colors.white, 38),
                      ],
                    )

                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Wrap(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 15,right: 5),
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                children: [
                                  SvgPicture.asset('assets/images/totalPatient.svg',),
                                  SizedBox(width: 5,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      components().text("Total Patients", FontWeight.normal, Color(0xff262626), 16),
                                      components().text("100", FontWeight.w500, Color(0xff262626), 24),
                                      components().text("Till Today", FontWeight.w100, Color(0xff262626), 14),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15,left: 5),
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                children: [
                                  SvgPicture.asset('assets/images/pendingAppointment.svg',),
                                  SizedBox(width: 5,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      components().text("Total Doctors", FontWeight.normal, Color(0xff262626), 16),
                                      components().text("100", FontWeight.w500, Color(0xff262626), 24),
                                      components().text(DateFormat.yMMMd().format(DateTime.now()), FontWeight.w200, Color(0xff262626), 14),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Wrap(
                          children: [
                            buildButton("addDoctor.png", "Add Doctors", 0.2, addDoctors()),
                            buildButton("addHospital.jpg", "Add Hospital",0.2, addHospital()),
                            buildButton("review.png", "View Doctors", 0.15, viewDoctors()),
                            buildButton("schedule.png", "View Patients",0.15, viewPatients()),
                            buildButton("profile.png", "Profile",0.15, Container()),
                            buildButton("logout.png", "logout",0.15, loginScreen())
                          ],
                        )
                      ],
                    )

                ),

              ],
            ),
          )
        ),
      ),
    );
  }

  Widget buildButton(String image, String data, double size, Widget screen) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.all(12),
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(5),
          color: Color(0xfff6f6f4),
          boxShadow: [BoxShadow(color: Colors.black26,blurRadius: 5, blurStyle: BlurStyle.outer)]
        ),
        child: Column(
          children: [
            // SvgPicture.asset("assets/images/appointment.png",),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.11,
              child:Image(image: AssetImage("assets/images/"+image),width: MediaQuery.of(context).size.width * size, fit: BoxFit.fitWidth,),
            ),
            components().text(data, FontWeight.w300, colors().logo_darkBlue, 18)
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen,));
      },
    );
  }


}
